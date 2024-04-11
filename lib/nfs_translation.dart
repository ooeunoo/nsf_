// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

class Message {
  Message._();

  static String my_box = 'my_box'.tr;
  static String profile = 'profile'.tr;
  static String no_rank = 'no_rank'.tr;
  static String no_log = 'no_log'.tr;
  static String today_rating = 'today_rating'.tr;
  static String please_set_the_exercise_you_want_to_do =
      'please_set_the_exercise_you_want_to_do'.tr;
  static String today_workout_settings = 'today_workout_settings'.tr;
  static String please_add_exerciese_log = 'please_add_exerciese_log'.tr;
  static String add_log = 'add_log'.tr;
  static String chatting = 'chatting'.tr;
  static String did_you_achieve_it_within_the_time_limit =
      'Did you achieve it within the time limit'.tr;
  static String yes_i_achieved_it = 'yes_i_achieved_it'.tr;
  static String no_i_failed = 'no_i_failed'.tr;
  static String please_add_up_all_the_weights_you_exercised =
      'please_add_up_all_the_weights_you_exercised'.tr;
  static String complete = 'complete'.tr;
}

class NFSTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          // Root View
          'my_box': '내 박스',
          'profile': '내 정보',

          // My Box View
          'no_rank': '등수 없음',
          'no_log': '기록 없음',
          'today_rating': '오늘의 랭킹',
          'please_set_the_exercise_you_want_to_do': '진행할 운동을 설정해주세요',
          'today_workout_settings': '오늘의 운동 설정',
          'please_add_exerciese_log': '운동 기록을 추가해 주세요',
          'add_log': '기록 추가',
          'chatting': '채팅',
          'did_you_achieve_it_within_the_time_limit': '제한 시간 안에 달성했나요?',
          'yes_i_achieved_it': '네, 달성했어요',
          'no_i_failed': '아니요, 실패했어요',
          'please_add_up_all_the_weights_you_exercised': '운동한 모든 무게를 합산해 주세요.',
          'complete': '완료',
        },
        'en_US': {
          // Root View
          'my_Box': 'My Box',
          'profile': 'Profile',

          // My Box View
          'no_rank': '',
          'no_log': '',
          'today_rating': '',
          'please_set_the_exercise_you_want_to_do': '',
          'today_workout_settings': '',
          'please_add_exerciese_log': '',
          'add_log': '',
          'chatting': '',
          'did_you_achieve_it_within_the_time_limit': '',
          'yes_i_achieved_it': '',
          'no_i_failed': '',
          'please_add_up_all_the_weights_you_exercised': '',
          'complete': '',
        },
      };
}
