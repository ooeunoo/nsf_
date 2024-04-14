import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/box/box_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BoxController extends GetxController {
  final AuthService _authService = Get.find();

  final _client = Supabase.instance.client;

  final Rxn<BoxModel> box = Rxn<BoxModel>();
  // BoxModel? get box => _box.value;

  @override
  void onInit() {
    super.onInit();
    ever(_authService.user, (user) async {
      await _checkBox();
    });
  }

  _checkBox() async {
    UserModel? user = _authService.user.value;

    if (user != null && user.boxId != null) {
      int boxId = user.boxId!;
      box.value = await _getBox(boxId);
    } else {
      box.value = null;
    }
  }

  Future<BoxModel> _getBox(int id) async {
    final data = await _client
        .from(Constants.boxTable)
        .select('*')
        .eq('id', id)
        .single();
    return BoxModel.fromJson(data);
  }
}
