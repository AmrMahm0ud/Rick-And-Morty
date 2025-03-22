import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/resources/image_paths.dart';

class CustomEmptyListWidget extends StatelessWidget {
  const CustomEmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagePaths.emptyCharacter,
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Empty Character",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorManager.black,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
