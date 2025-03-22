import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/config/routes/routes_manager.dart';
import 'package:rick/core/base/widget/base_stateful_widget.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/presentation/blocs/favorite_character/favorite_character_bloc.dart';
import 'package:rick/presentation/screens/character/widget/character_card_widget.dart';
import 'package:rick/presentation/screens/favorite_character/widget/favorite_character_skeleton_effect_widget.dart';
import 'package:rick/presentation/widgets/build_app_bar_widget.dart';
import 'package:rick/presentation/widgets/custom_empty_list_widget.dart';

class FavoriteCharacterScreen extends BaseStatefulWidget {
  const FavoriteCharacterScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _FavoriteCharacterScreenState();
}

class _FavoriteCharacterScreenState extends BaseState<FavoriteCharacterScreen> {
  FavoriteCharacterBloc get _bloc =>
      BlocProvider.of<FavoriteCharacterBloc>(context);
  List<Character> characters = [];

  @override
  void initState() {
    _getFavoriteCharacter();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: "Favorite Character", isHaveBackButton: false),
      body: BlocConsumer<FavoriteCharacterBloc, FavoriteCharacterState>(
        listener: (context, state) {
          if (state is SuccessGetFavoriteCharacterState) {
            characters = state.character;
          }
        },
        builder: (context, state) {
          if (state is FavoriteCharacterShowSkeletonState ||
              state is FavoriteCharacterInitial) {
            return const FavoriteCharacterSkeletonEffectWidget();
          } else {
            return characters.isEmpty
                ? const CustomEmptyListWidget()
                : ListView.builder(
                    itemCount: characters.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.characterDetail,
                              arguments: characters[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CharacterCardWidget(
                            character: characters[index],
                            unFavorite: (id) {
                              _unFavoriteCharacter(id);
                            },
                          ),
                        ),
                      );
                    });
          }
        },
      ),
    );
  }

  void _getFavoriteCharacter() {
    _bloc.add(GetFavoriteCharacterEvent());
  }

  void _unFavoriteCharacter(int id) {
    _bloc.add(UnFavoriteCharacterEvent(id));
  }
}
