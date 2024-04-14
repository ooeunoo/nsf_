import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/routes/app_pages.dart';
import 'package:nsf/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final _client = Supabase.instance.client;

  late Stream<User?> user$;
  final Rx<UserModel?> user = (null as UserModel?).obs;

  AuthService() {
    _subscribeUser().listen((event) async {
      if (event == null) {
        user.value = null;
        Get.offAllNamed(Routes.login);
      } else {
        _refreshSignedUser(event.id);
        Get.offAllNamed(Routes.root);
      }
    });
  }

  Future<bool> loginWithKakao() async {
    return _client.auth.signInWithOAuth(
      OAuthProvider.kakao,
      redirectTo: Constants.loginRedirectTo,
      authScreenLaunchMode: LaunchMode.platformDefault,
    );
  }

  Future<bool> loginWithApple() async {
    return _client.auth.signInWithOAuth(
      OAuthProvider.apple,
    );
  }

  Future<void> logout() async {
    _client.auth.signOut();
  }

  Stream<User?> _subscribeUser() {
    user$ = _client.auth.onAuthStateChange.map((event) {
      return event.session?.user;
    });
    return user$;
  }

  _refreshSignedUser(String id) async {
    user.value = await getUser(id);
  }

  Future<UserModel> getUser(String id) async {
    final data = await _client
        .from(Constants.userTable)
        .select('*')
        .eq('id', id)
        .single();

    return UserModel.fromJson(data);
  }

  Future<void> uploadProfileImage(XFile image) async {
    final String? userId = user.value?.id;
    if (userId == null) return;

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
    imageUrl = Uri.parse(imageUrl).toString();

    await _client.from('user').update({'image_url': imageUrl}).eq('id', userId);
    _refreshSignedUser(userId);
  }
}
