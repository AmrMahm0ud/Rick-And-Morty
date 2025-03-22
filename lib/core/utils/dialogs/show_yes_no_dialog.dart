// import 'package:flutter/material.dart';
// import 'package:ugp/src/config/theme/values_manager.dart';
// import 'package:ugp/src/presentation/widgets/yes_no_dialog_widget.dart';
//
// Future showYesNoDialog({
//   required BuildContext context,
//   required String dialogMessage,
//   required Function() actionButtonOnTap,
//   required Function() cancelButtonOnTap,
//   required String cancelButtonText,
//   required String actionButtonText,
// }) =>
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) => Dialog(
//         insetPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
//         elevation: AppSize.s0,
//         backgroundColor: Colors.transparent,
//         child: YesNoDialogWidget(
//           actionButtonOnTap: actionButtonOnTap,
//           cancelButtonOnTap: cancelButtonOnTap,
//           dialogMessage: dialogMessage,
//           actionButtonText: actionButtonText,
//           cancelButtonText: cancelButtonText,
//         ),
//       ),
//     );
