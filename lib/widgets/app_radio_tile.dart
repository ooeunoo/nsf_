import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';

class AppRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final void Function(T? value) onChanged;
  final Widget title;
  final Widget? subtitle;
  final bool selected;

  const AppRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.subtitle,
    required this.selected,
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
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        dense: true,
        isThreeLine: subtitle != null ? true : false,
        activeColor: AppColor.brand600,
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
