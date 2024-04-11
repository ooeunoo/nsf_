import 'package:get/get.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/routes/app_pages.dart';
import 'package:nsf/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final _client = Supabase.instance.client;

  AuthService() {
    _subscribeUser().listen((event) async {
      if (event == null) {
        user.value = null;
        Get.offAllNamed(Routes.login);
      } else {
        user.value = await _getCurrentUser(event.id);
        Get.offAllNamed(Routes.root);
      }
    });
  }

  final Rx<UserModel?> user = (null as UserModel?).obs;

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

  Future<UserModel> _getCurrentUser(String id) async {
    final data = await _client.from('users').select('*').eq('id', id).single();

    return UserModel.fromJson(data);
  }
}