import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/resources/image_paths.dart';


class BottomSheetWidget extends StatelessWidget {
  final Widget content;
  final double height;

  const BottomSheetWidget({
    Key? key,
    required this.content,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // This makes the column wrap its content
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      ImagePaths.close,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
