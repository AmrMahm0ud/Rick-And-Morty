import 'package:flutter/material.dart';
import 'package:rick/presentation/widgets/bottom_sheet_widget.dart';

Future showBottomSheetWidget({
  required BuildContext context,
  required Widget content,
  String? titleImagePath = "",
  double height = 300,
}) async {
  return await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BottomSheetWidget(
              height: height,
              content: content,
            ),
          ));
}
