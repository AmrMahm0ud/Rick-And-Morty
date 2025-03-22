import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick/core/resources/image_paths.dart';

class CharacterImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;

  final double height;

  CharacterImageWidget(
      {super.key,
      required this.imagePath,
      this.width = 100,
      this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset(
              ImagePaths.placeHolder,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
