import 'package:flutter/material.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/base/widget/base_stateful_widget.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/presentation/screens/character/widget/character_image_widget.dart';
import 'package:rick/presentation/screens/character_detail/widget/episode_chips_widget.dart';
import 'package:rick/presentation/widgets/build_app_bar_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarWidget(context,
            title: character.name,
            isHaveBackButton: true, onBackButtonPressed: () {
          Navigator.pop(context);
        }),
        body: Container(
            margin: const EdgeInsetsDirectional.symmetric(
                vertical: 10, horizontal: 15),
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 24,
                    spreadRadius: 0,
                    color: ColorManager.shadowColor,
                  ),
                ]),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterImageWidget(
                      imagePath: character.image,
                      width: double.infinity,
                      height: 300,
                    ),
                    const SizedBox(width: 8),
                    _buildItem(
                        label: "Name", value: character.name, context: context),
                    _buildItem(
                        label: "Status",
                        value: character.status,
                        context: context),
                    _buildItem(
                        label: "Spices",
                        value: character.species,
                        context: context),
                    _buildItem(
                        label: "Gender",
                        value: character.gender,
                        context: context),
                    character.type != ""
                        ? _buildItem(
                            label: "Type",
                            value: character.type,
                            context: context)
                        : const SizedBox(),
                    _buildItem(
                        label: "Origin Location",
                        value: character.origin.name,
                        context: context),
                    _buildItem(
                        label: "Current Location",
                        value: character.location.name,
                        context: context),
                    EpisodeChipsWidget(episodeUrls: character.episode),
                    const SizedBox(height: 8),
                  ]),
            )));
  }

  _buildItem(
      {required String label,
      required String value,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorManager.black, fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorManager.gray,
                fontWeight: FontWeight.w600,
                fontSize: 12),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
