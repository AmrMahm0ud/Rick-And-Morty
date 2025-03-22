import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/resources/image_paths.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/presentation/screens/character/widget/character_image_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  final Character character;
  final Function(Character)? favorite;
  final Function(int) unFavorite;

  CharacterCardWidget(
      {super.key,
      required this.character,
      this.favorite,
      required this.unFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterImageWidget(imagePath: character.image),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          child: Text(
                            character.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              if (character.isFavorite) {
                                unFavorite(character.id);
                              } else {
                                favorite!(character);
                              }
                            },
                            child: SizedBox(
                                child: SvgPicture.asset(
                              ImagePaths.favorite,
                              color: character.isFavorite
                                  ? ColorManager.primary
                                  : null,
                            )),
                          ))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.status,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: ColorManager.gray, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.species,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: ColorManager.gray, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
