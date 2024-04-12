import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsf/models/message/message_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_avatar.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:timeago/timeago.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimens.size20,
      ),
      child: Row(
          mainAxisAlignment:
              message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(
              width: message.isMine
                  ? MediaQuery.of(context).size.width * 0.7
                  : MediaQuery.of(context).size.width * 0.9,
              child:
                  message.isMine ? _myBubble(context) : _otherBubble(context),
            ),
          ]),
    );
  }

  Widget _myBubble(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.size4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText("나",
                  style: Theme.of(context).textTheme.textSM.copyWith(
                      color: AppColor.gray700,
                      fontWeight: AppFontWeight.medium)),
              AppText(format(message.createdAt),
                  style: Theme.of(context).textTheme.textXS.copyWith(
                      color: AppColor.gray600,
                      fontWeight: AppFontWeight.regular))
            ],
          ),
        ),
        AppSpacerV(value: AppDimens.size4),
        Container(
          width: double.infinity, // 수정된 부분: Container의 width를 확장
          padding: EdgeInsets.symmetric(
            vertical: AppDimens.size8,
            horizontal: AppDimens.size12,
          ),
          decoration: BoxDecoration(
            color: AppColor.brand600,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.size8),
              bottomLeft: Radius.circular(AppDimens.size8),
              bottomRight: Radius.circular(AppDimens.size8),
            ),
            border: Border.all(
              color: AppColor.brand600,
              width: 1.0,
            ),
          ),
          child: AppText(
            message.content,
            maxLines: null,
            style: Theme.of(context).textTheme.textMD.copyWith(
                  color: AppColor.white,
                  fontWeight: AppFontWeight.regular,
                ),
          ),
        ),
      ],
    );
  }

  Widget _otherBubble(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppAvatar(),
        AppSpacerH(value: AppDimens.size10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.size4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText("한명욱",
                        style: Theme.of(context).textTheme.textSM.copyWith(
                            color: AppColor.gray700,
                            fontWeight: AppFontWeight.medium)),
                    AppText(format(message.createdAt),
                        style: Theme.of(context).textTheme.textXS.copyWith(
                            color: AppColor.gray600,
                            fontWeight: AppFontWeight.regular))
                  ],
                ),
              ),
              AppSpacerV(value: AppDimens.size4), // 이름과 시간 간격 조정
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColor.gray200,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: AppColor.gray200,
                    width: 1.0,
                  ),
                ),
                child: AppText(
                  message.content,
                  maxLines: null,
                  style: Theme.of(context).textTheme.textMD.copyWith(
                        color: AppColor.gray900,
                        fontWeight: AppFontWeight.regular,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
