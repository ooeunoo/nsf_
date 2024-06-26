import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/chat/chat.controller.dart';
import 'package:nsf/models/message/message_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/widgets/app_avatar.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:timeago/timeago.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final UserModel? user;

  const MessageBubble({
    super.key,
    required this.message,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimens.size10, bottom: AppDimens.size10),
      child: Row(
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          message.isMine ? _myBubble(context) : _otherBubble(context),
        ],
      ),
    );
  }

  Widget _myBubble(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.09,
              child: const SizedBox(
                  // width: AppDimens.size40,
                  // height: AppDimens.size40,
                  ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.size4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "나",
                        style: Theme.of(context).textTheme.textSM.copyWith(
                              color: AppColor.gray700,
                              fontWeight: AppFontWeight.medium,
                            ),
                      ),
                      AppSpacerH(value: AppDimens.size4),
                      AppText(
                        formatCreatedAt(message.createdAt),
                        style: Theme.of(context).textTheme.textXS.copyWith(
                              color: AppColor.gray600,
                              fontWeight: AppFontWeight.regular,
                            ),
                      ),
                    ],
                  ),
                ),
                AppSpacerV(value: AppDimens.size4),
                Container(
                  width: double.infinity, // 내용 영역을 가능한 한 최대로 확장
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherBubble(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: AppAvatar(imageUrl: user?.imageUrl),
          ),
          AppSpacerH(value: AppDimens.size10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.size4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        user?.name ?? user?.nickname ?? '알수없음',
                        style: Theme.of(context).textTheme.textSM.copyWith(
                              color: AppColor.gray700,
                              fontWeight: AppFontWeight.medium,
                            ),
                      ),
                      AppText(
                        formatCreatedAt(message.createdAt),
                        style: Theme.of(context).textTheme.textXS.copyWith(
                              color: AppColor.gray600,
                              fontWeight: AppFontWeight.regular,
                            ),
                      ),
                    ],
                  ),
                ),
                AppSpacerV(value: AppDimens.size4),
                Container(
                  width: double.infinity, // 내용 영역을 가능한 한 최대로 확장
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
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
      ),
    );
  }
}
