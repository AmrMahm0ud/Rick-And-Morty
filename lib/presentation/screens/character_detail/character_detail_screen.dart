import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/base/widget/base_stateful_widget.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/presentation/screens/character/widget/character_image_widget.dart';
import 'package:rick/presentation/screens/character_detail/widget/episode_chips_widget.dart';
import 'package:rick/presentation/widgets/build_app_bar_widget.dart';

class CharacterDetailScreen extends BaseStatefulWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends BaseState<CharacterDetailScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarWidget(context,
            title: widget.character.name,
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
                      imagePath: widget.character.image,
                      width: double.infinity,
                      height: 300,
                    ),
                    const SizedBox(width: 8),
                    _buildItem(label: "Name", value: widget.character.name),
                    _buildItem(label: "Status", value: widget.character.status),
                    _buildItem(
                        label: "Spices", value: widget.character.species),
                    _buildItem(label: "Gender", value: widget.character.gender),
                    _buildItem(label: "Type", value: widget.character.type),
                    _buildItem(
                        label: "Origin Location",
                        value: widget.character.origin.name),
                    _buildItem(
                        label: "Current Location",
                        value: widget.character.location.name),
                    EpisodeChipsWidget(episodeUrls: widget.character.episode),
                    const SizedBox(height: 8),
                  ]),
            )));
  }

  _buildItem({required String label, required String value}) {
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
