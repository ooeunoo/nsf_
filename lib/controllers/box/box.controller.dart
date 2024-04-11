import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/box/box_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/views/my_box/my_box.dart';
import 'package:nsf/views/profile/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BoxController extends GetxController {
  final AuthService _authService = Get.find();

  final _client = Supabase.instance.client;

  Rxn<BoxModel> box = Rxn<BoxModel>();

  @override
  void onInit() {
    super.onInit();
    _checkBox();
  }

  _checkBox() async {
    print('check box');
    UserModel? user = _authService.user.value;

    if (user != null && user.box_id != null) {
      int boxId = user.box_id!;
      box.value = await _getBox(boxId);
    } else {
      box.value = null;
    }
  }

  Future<BoxModel> _getBox(int id) async {
    final data = await _client.from('boxes').select('*').eq('id', id).single();
    return BoxModel.fromJson(data);
  }
}
