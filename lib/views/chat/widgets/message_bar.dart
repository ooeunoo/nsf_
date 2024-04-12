import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/chat/chat.controller.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_text_input.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({super.key});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  bool _isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: AppDimens.size10,
            left: AppDimens.size20,
            bottom:
                _isKeyboardVisible ? 0 : AppDimens.size20, // 키보드가 나타날 때 패딩 제거
          ),
          child: Row(
            children: [
              Expanded(
                child: AppTextInput(
                  controller: controller.textController,
                  textInputAction: TextInputAction.newline,
                  onTapOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    setState(() {
                      _isKeyboardVisible =
                          MediaQuery.of(context).viewInsets.bottom > 0;
                    });
                  },
                ),
              ),
              const AppSpacerH(),
              AppButton(
                'send',
                onPressed: controller.onSubmitMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
