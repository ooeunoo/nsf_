// Created with [AIPRM Prompt "Flutter Engineer"](https://www.aiprm.com/prompts/softwareengineering/backend-development/1807397674459332608/)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/chat/chat.controller.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/views/chat/widgets/message_bar.dart';
import 'package:nsf/views/chat/widgets/message_bubble.dart';
import 'package:nsf/widgets/app_loader.dart';
import 'package:nsf/widgets/app_text.dart';

class ChatRoom extends StatelessWidget {
  final bool reverse;
  final bool onlyMessage;
  final double? horizontalPadding;

  const ChatRoom({
    super.key,
    this.onlyMessage = false,
    this.reverse = true,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.find<ChatController>();

    return Obx(() {
      if (controller.loading) {
        return const Center(child: AppLoader());
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Obx(() => GestureDetector(
                  onTap: () => controller.messageFocusNode.unfocus(),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.subscribers.isEmpty)
                          Center(
                            child: AppText(
                              '대화를 시작해보세요 :)',
                              style: Theme.of(context)
                                  .textTheme
                                  .textXL
                                  .copyWith(color: AppColor.gray600),
                            ),
                          ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          reverse: reverse,
                          itemCount: controller.subscribers.length,
                          itemBuilder: (context, index) {
                            final message = controller.subscribers[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding ?? 0),
                              child: MessageBubble(
                                message: message,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          // Display MessageBar at the bottom
          if (!onlyMessage) const MessageBar(),
        ],
      );
    });
  }
}
