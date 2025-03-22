import 'package:flutter/material.dart';
import 'package:rick/config/theme/color_manager.dart';

class EpisodeChipsWidget extends StatelessWidget {
  final List<String> episodeUrls;

  const EpisodeChipsWidget({super.key, required this.episodeUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Episodes",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorManager.black, fontWeight: FontWeight.w500),
          maxLines: 1,
        ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: episodeUrls.map((url) {
            String episodeNumber =
                url.split('/').last; // Extract episode number
            return Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Custom radius
                side: const BorderSide(
                  color: ColorManager.primary, // Custom border color
                  width: 1,
                ),
              ),
              label: Text('Episode $episodeNumber'),
              backgroundColor: ColorManager.white,
            );
          }).toList(),
        ),
      ],
    );
  }
}
