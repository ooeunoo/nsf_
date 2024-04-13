import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/routes/app_pages.dart';
import 'package:nsf/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final _client = Supabase.instance.client;

  AuthService() {
    _subscribeUser().listen((event) async {
      if (event == null) {
        _user.value = null;
        Get.offAllNamed(Routes.login);
      } else {
        _refreshUser(event.id);
        Get.offAllNamed(Routes.root);
      }
    });
  }

  final Rx<UserModel?> _user = (null as UserModel?).obs;
  UserModel? get user => _user.value;

  Future<bool> loginWithKakao() async {
    return _client.auth.signInWithOAuth(
      OAuthProvider.kakao,
      redirectTo: Constants.loginRedirectTo,
      authScreenLaunchMode: LaunchMode.platformDefault,
    );
  }

  Future<void> logout() async {
    _client.auth.signOut();
  }

  Stream<User?> _subscribeUser() {
    return _client.auth.onAuthStateChange.map((event) {
      return event.session?.user;
    });
  }

  _refreshUser(String id) async {
    _user.value = await _getCurrentUser(id);
  }

  Future<UserModel> _getCurrentUser(String id) async {
    final data = await _client
        .from(Constants.userTable)
        .select('*')
        .eq('id', id)
        .single();

    return UserModel.fromJson(data);
  }

  Future<void> uploadProfileImage(XFile image) async {
    if (user == null) return;
    final String userId = user!.id;

    final imageExtension = image.path.split('.').last.toLowerCase();
    final imageBytes = await image.readAsBytes();
    final imagePath = '/$userId/profile';

    await _client.storage.from('user').uploadBinary(
          imagePath,
          imageBytes,
          fileOptions: FileOptions(
            upsert: true,
            contentType: 'image/$imageExtension',
          ),
        );
    String imageUrl = _client.storage.from('user').getPublicUrl(imagePath);
    imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
      't': DateTime.now().millisecondsSinceEpoch.toString()
    }).toString();

    await _client.from('user').update({'image_url': imageUrl}).eq('id', userId);
    _refreshUser(userId);
  }
}
