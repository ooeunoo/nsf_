import 'package:get/get.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/constants.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/views/my_box/widgets/modals/register_wod_modal.dart';
import 'package:nsf/views/my_box/widgets/modals/update_wod_modal.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum WodState {
  noRegistered, // 아직 미등록
  noCompleted, // 등록되었지만 완료하지않은 상태
  completed //  완료 상태
}

class WodController extends GetxController {
  final AuthService _authService = Get.find();

  final _client = Supabase.instance.client;

  final Rxn<WodModel> _myWod = Rxn<WodModel>();
  final Rxn<int> _myWodRanking = Rxn<int>(null);
  final Rxn<List<WodModel>> _top3Wods = Rxn<List<WodModel>>();

  WodState get wodState => _refreshWodState();
  WodModel? get myWod => _myWod.value;
  int? get myWodRanking => _myWodRanking.value;
  List<WodModel>? get top3Wods => _top3Wods.value;

  @override
  void onInit() async {
    super.onInit();
    await _checkWods();
  }

  void onOpenRegisterWodModal() {
    Get.bottomSheet(const RegisterWodModal(),
            isDismissible: true,
            isScrollControlled: true,
            enableDrag: false,
            useRootNavigator: true)
        .whenComplete(() async {
      await _checkWods();
      _refreshWodState();
    });
  }

  void onOpenUpdateWodModal() {
    Get.bottomSheet(UpdateWodModal(wodId: myWod!.id),
            isDismissible: true,
            isScrollControlled: true,
            enableDrag: false,
            useRootNavigator: true)
        .whenComplete(() async {
      notifyUpdatedWod();
      await _checkWods();
      _refreshWodState();
    });
  }

  // 와드 상태를 업데이트
  WodState _refreshWodState() {
    if (myWod == null) {
      return WodState.noRegistered;
    }
    bool completed = myWod!.completion;

    if (!completed) {
      return WodState.noCompleted;
    } else {
      return WodState.completed;
    }
  }

  _checkWods() async {
    UserModel? user = _authService.user;
    if (user?.boxId != null) {
      String userId = user!.id;
      int boxId = user.boxId!;
      List<WodModel> wods = await _getWodsInBox(boxId);

      // 와드가 비어있지 않다면
      if (wods.isNotEmpty) {
        int myWodIndex = wods.indexWhere((item) => item.user.id == userId);
        _myWod.value = myWodIndex == -1 ? null : wods[myWodIndex];
        _myWodRanking.value = myWodIndex == -1 ? null : myWodIndex;

        // 와드의 갯수가 3개 이상이라면
        if (wods.length > 3) {
          _top3Wods.value = wods.sublist(0, 2);
        } else {
          // 3개 미만이라면
          _top3Wods.value = wods;
        }
      }
    } else {
      _myWod.value = null;
      _myWodRanking.value = null;
      _top3Wods.value = null;
    }
  }

  Future<List<WodModel>> _getWodsInBox(int boxId) async {
    final data = await _client
        .from(Constants.wodTable)
        .select('*, user(*), box(*)')
        .eq('box_id', boxId)
        .eq('date', getTodayDateTime())
        .order('completion_time', ascending: true)
        .order('completion_lbs', ascending: true);

    return data.map((d) => WodModel.fromJson(d)).toList();
  }
}
