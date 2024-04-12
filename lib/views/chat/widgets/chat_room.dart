import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/chat/chat.controller.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/views/chat/widgets/message_bar.dart';
import 'package:nsf/views/chat/widgets/message_bubble.dart';
import 'package:nsf/widgets/app_text.dart';

class ChatRoom extends StatelessWidget {
  final bool reverse;
  final bool onlyMessage;
  final double? horizontalPadding;

  const ChatRoom(
      {super.key,
      this.onlyMessage = false,
      this.reverse = true,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.find<ChatController>();

    return SingleChildScrollView(
      child: Obx(() => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: controller.subscribers.isEmpty
                    ? Center(
                        child: AppText('대화를 시작해보세요 :)',
                            style: Theme.of(context)
                                .textTheme
                                .textXL
                                .copyWith(color: AppColor.gray600)),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: reverse,
                        itemCount: controller.subscribers.length,
                        itemBuilder: (context, index) {
                          final message = controller.subscribers[index];

                          // _loadProfileCache(message.profileId);

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding ?? 0),
                            child: MessageBubble(
                              message: message,
                            ),
                          );
                        },
                      ),
              ),
              if (!onlyMessage) ...{
                const MessageBar(),
              }
            ],
          )),
    );
  }
}
