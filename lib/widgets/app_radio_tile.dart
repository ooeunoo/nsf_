import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';

class AppRadioTile extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final Widget title;
  final Widget? subtitle;

  const AppRadioTile({
    super.key,
    this.value,
    this.groupValue,
    required this.onChanged,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-10, 0),
      child: RadioListTile(
        title: title,
        subtitle: subtitle,
        value: value,
        groupValue: groupValue,
        onChanged: (value) {},
        contentPadding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        dense: true,
        isThreeLine: true,
        activeColor: AppColor.gray300,
        tileColor: Colors.transparent,
        selectedTileColor: Colors.transparent,
        controlAffinity: ListTileControlAffinity.leading,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.size10),
          side: const BorderSide(
            color: AppColor.gray300,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
