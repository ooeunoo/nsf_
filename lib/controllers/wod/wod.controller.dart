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

  final RxList<WodModel> _totalWods = RxList([]);
  final RxList<WodModel> _prevTop3Wods = RxList([]);
  final RxList<WodModel> _curTop3Wods = RxList([]);
  final Rxn<WodModel> _myWod = Rxn<WodModel>();
  final Rx<WodState> _myWodState = Rx<WodState>(WodState.noRegistered);
  final Rxn<int> _myWodRanking = Rxn<int>(null);

  List<WodModel> get totalWods => _totalWods;
  List<WodModel>? get prevTop3Wods => _prevTop3Wods;
  List<WodModel>? get curTop3Wods => _curTop3Wods;
  WodModel? get myWod => _myWod.value;
  WodState get wodState => _myWodState.value;
  int? get myWodRanking => _myWodRanking.value;

  @override
  void onInit() async {
    _listenWods();

    super.onInit();
  }

  void _listenWods() {
    UserModel? user = _authService.user;
    if (user == null) return;
    String userId = user.id;
    int boxId = user.boxId!;
    setupWods(userId, boxId);

    _client
        .channel('${Constants.wodTable}:box_id=eq.$boxId')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: Constants.wodTable,
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'date',
              value: getTodayDateTime(),
            ),
            callback: (payload) async {
              setupWods(userId, boxId);
            })
        .subscribe();
  }

  void onOpenRegisterWodModal() {
    Get.bottomSheet(const RegisterWodModal(),
            isDismissible: true,
            isScrollControlled: true,
            enableDrag: false,
            useRootNavigator: true)
        .whenComplete(() async {});
  }

  void onOpenUpdateWodModal() {
    Get.bottomSheet(UpdateWodModal(wodId: myWod!.id),
            isDismissible: true,
            isScrollControlled: true,
            enableDrag: false,
            useRootNavigator: true)
        .whenComplete(() async {
      notifyUpdatedWod();
    });
  }

  setupWods(String userId, int boxId) async {
    List<WodModel> wods = await _getWodsInBox(boxId);

    _totalWods.value = wods;
    _checkMyWod(wods, userId);
    _checkTop3Wod(wods);
  }

  Future<List<WodModel>> _getWodsInBox(int boxId) async {
    final data = await _client
        .from(Constants.wodTable)
        .select('*, user(*), box(*)')
        .eq('box_id', boxId)
        .eq('date', getTodayDateTime())
        // 순위 지정 조건 정의
        .order('completion_time', ascending: true)
        .order('completion_lbs', ascending: true);

    return data.map((d) => WodModel.fromJson(d)).toList();
  }

  void _checkMyWod(List<WodModel> wods, String userId) {
    wods.asMap().forEach((index, wod) {
      if (wod.userId != userId) return;
      bool completion = wod.completion;
      _myWod.value = wod;
      _myWodRanking.value = completion ? index : null;
      _myWodState.value =
          completion ? WodState.completed : WodState.noCompleted;
    });
  }

  void _checkTop3Wod(List<WodModel> wods) {
    _prevTop3Wods.value = _curTop3Wods;
    _curTop3Wods.value = wods.where((wod) => wod.completion).take(3).toList();
  }
}
