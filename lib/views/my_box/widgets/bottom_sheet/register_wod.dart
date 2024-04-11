import 'package:flutter/material.dart';
import 'package:nsf/models/forms/form_short_cut_model.dart';
import 'package:nsf/models/forms/select_option_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_bottom_sheet_wrap.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_handle_bar.dart';
import 'package:nsf/widgets/app_radio_tile.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:nsf/widgets/form/number_form.dart';
import 'package:nsf/widgets/form/selection_form.dart';

class RegisterWod extends StatelessWidget {
  const RegisterWod({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWrap(
        child: Padding(
      padding: EdgeInsets.only(top: AppDimens.size10, bottom: AppDimens.size10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          NumberForm(
            title: '시간 제한을 입력해주세요',
            chipTitle: '운동설정',
            shortcuts: [
              FormShortCutModel(
                  name: '10분',
                  action: () {
                    print('10분');
                  }),
              FormShortCutModel(
                  name: '20분',
                  action: () {
                    print('20분');
                  }),
              FormShortCutModel(
                  name: '30분',
                  action: () {
                    print('30분');
                  }),
            ],
          )
          // FormSelection(
          //   chipTitle: '운동설정',
          //   title: '운동 타입을 설정해주세요',
          //   options: WodType.values.map((type) {
          //     return SelectOptionModel(
          //         title: type.toString(),
          //         subTitle: type.description.toString(),
          //         value: type.toString(),
          //         groupValue: '');
          //   }).toList(),
          //   onSelect: () {},
          // ),
        ],
      ),
    ));
  }

  Widget _selectWodType(BuildContext context) {
    generateWodTiles(BuildContext context) {
      return WodType.values.map((type) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppDimens.size5),
          child: AppRadioTile(
            onChanged: () {},
            title: AppText(
              type.toString().split('.').last, // enum 값에서 '.' 이후의 문자열만 가져오기
              style: Theme.of(context).textTheme.textMD.copyWith(
                    color: AppColor.gray700,
                    fontWeight: AppFontWeight.bold,
                  ),
            ),
            subtitle: AppText(
              type.description,
              style: Theme.of(context).textTheme.textSM.copyWith(
                    color: AppColor.gray600,
                    fontWeight: AppFontWeight.medium,
                  ),
            ),
            value: type,
            // groupValue: selectedWodType, // 선택된 값에 따라 groupValue 설정
          ),
        );
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppChip(text: '운동설정'),
                AppText('운동 타입을 선택해주세요',
                    style: Theme.of(context).textTheme.textXL.copyWith(
                        color: AppColor.gray900,
                        fontWeight: AppFontWeight.bold)),
              ],
            )),
        const AppSpacerV(),
        ...generateWodTiles(context),
      ],
    );
  }

  Widget _selectTimeLimit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.size20v),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.size20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppChip(text: '운동설정'),
                  AppText('시간 제한이 있나요?',
                      style: Theme.of(context).textTheme.textXL.copyWith(
                          color: AppColor.gray900,
                          fontWeight: AppFontWeight.bold)),
                ],
              )),
          const AppSpacerV(),
          AppRadioTile(
            onChanged: () {},
            title: AppText("For Time",
                style: Theme.of(context).textTheme.textMD.copyWith(
                    color: AppColor.gray700, fontWeight: AppFontWeight.bold)),
            subtitle: AppText("주어진 운동을 최대한 빠르게 수행",
                style: Theme.of(context).textTheme.textSM.copyWith(
                    color: AppColor.gray600, fontWeight: AppFontWeight.medium)),
            value: 1,
            groupValue: 1,
          )
        ],
      ),
    );
  }

  Widget _inputTimeLimit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.size20v),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.size20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppChip(text: '운동설정'),
                  AppText('시간 제한을 입력해주세요.',
                      style: Theme.of(context).textTheme.textXL.copyWith(
                          color: AppColor.gray900,
                          fontWeight: AppFontWeight.bold)),
                ],
              )),
          const AppSpacerV(),
          AppRadioTile(
            onChanged: () {},
            title: AppText("For Time",
                style: Theme.of(context).textTheme.textMD.copyWith(
                    color: AppColor.gray700, fontWeight: AppFontWeight.bold)),
            subtitle: AppText("주어진 운동을 최대한 빠르게 수행",
                style: Theme.of(context).textTheme.textSM.copyWith(
                    color: AppColor.gray600, fontWeight: AppFontWeight.medium)),
            value: 1,
            groupValue: 1,
          )
        ],
      ),
    );
  }
}
