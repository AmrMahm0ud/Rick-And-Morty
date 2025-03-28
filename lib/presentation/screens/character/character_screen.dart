import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick/config/routes/routes_manager.dart';
import 'package:rick/core/base/widget/base_stateful_widget.dart';
import 'package:rick/core/resources/image_paths.dart';
import 'package:rick/core/utils/show_bottom_sheet.dart';
import 'package:rick/core/utils/show_snack_bar.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/entity/character/character_filter/character_filter.dart';
import 'package:rick/domain/entity/lookup.dart';
import 'package:rick/presentation/blocs/character/character_bloc.dart';
import 'package:rick/presentation/blocs/character_filter/character_filter_bloc.dart';
import 'package:rick/presentation/screens/character/widget/character_bottom_sheet_filter_widget.dart';
import 'package:rick/presentation/screens/character/widget/character_card_widget.dart';
import 'package:rick/presentation/screens/character/widget/character_skeleton_effect_widget.dart';
import 'package:rick/presentation/widgets/build_app_bar_widget.dart';
import 'package:rick/presentation/widgets/custom_empty_list_widget.dart';
import 'package:rick/presentation/widgets/search_text_field_widget.dart';
import 'package:collection/collection.dart';

class CharacterScreen extends BaseStatefulWidget {
  const CharacterScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _CharacterScreenState();
}

class _CharacterScreenState extends BaseState<CharacterScreen> {
  CharacterBloc get _bloc => BlocProvider.of<CharacterBloc>(context);

  CharacterFilterBloc get _CharacterFilterBloc =>
      BlocProvider.of<CharacterFilterBloc>(context);
  TextEditingController _searchTextEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Character> characters = [];

  Lookup? selectedState;
  Lookup? selectedSpices;

  @override
  void initState() {
    _bloc.currentPage = 1;
    _resetFilter();
    _reset();
    _getCharacter();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: "Characters",
          isHaveBackButton: false,
          actionWidget: [
            InkWell(
              onTap: () {
                _showFilterBottomSheet();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(ImagePaths.filter),
              ),
            )
          ]),
      body: BlocConsumer<CharacterBloc, CharacterState>(
        listener: (context, state) {
          if (state is SuccessGetCharacterState) {
            characters = state.character;
          } else if (state is CharacterShowLoadingState) {
            showLoading();
          } else if (state is CharacterHideLoadingState) {
            hideLoading();
          } else if (state is CharacterResetState) {
            characters = [];
          } else if (state is FailGetCharacterState) {
            showCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CharacterShowSkeletonState ||
              state is CharacterInitial) {
            return const CharacterSkeletonEffectWidget();
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: SearchTextFieldWidget(
                    controller: _searchTextEditingController,
                    labelText: "Search",
                    iconPath: ImagePaths.search,
                    onSubmitted: (value) {
                      _reset();
                      _getCharacter(
                          name: value,
                          species: selectedSpices?.value ?? "",
                          status: selectedState?.value ?? "",
                          showLoading: true);
                    },
                    clearButtonAction: () {
                      _reset();
                      _searchTextEditingController.clear();
                      _getCharacter(
                          species: selectedSpices?.value ?? "",
                          status: selectedState?.value ?? "",
                          name: _searchTextEditingController.text,
                          showLoading: true);
                    },
                  ),
                ),
                characters.isEmpty
                    ? const Expanded(
                        child: Center(child: CustomEmptyListWidget()))
                    : Expanded(
                        child: ListView.builder(
                            itemCount: characters.length,
                            controller: _scrollController,
                            padding: const EdgeInsets.all(16),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.characterDetail,
                                      arguments: characters[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CharacterCardWidget(
                                    character: characters[index],
                                    favorite: (character) {
                                      _favoriteCharacter(character);
                                    },
                                    unFavorite: (id) {
                                      _unFavoriteCharacter(id);
                                    },
                                  ),
                                ),
                              );
                            }),
                      ),
              ],
            );
          }
        },
      ),
    );
  }

  void _showFilterBottomSheet() {
    showBottomSheetWidget(
      height: 330,
      context: context,
      content: const CharacterBottomSheetFilter(),
    ).then((value) {
      if (value != null) {
        CharacterFilter characterFilter = value;
        selectedState = characterFilter.status
            .firstWhereOrNull((element) => element.isSelected);
        selectedSpices = characterFilter.species
            .firstWhereOrNull((element) => element.isSelected);
        _reset();
        _getCharacter(
          name: _searchTextEditingController.text,
          status: selectedState?.value ?? "",
          species: selectedSpices?.value ?? "",
        );
      }
    });
  }

  void _getCharacter({
    String name = "",
    String status = "",
    String species = "",
    bool showLoading = false,
  }) {
    _bloc.add(GetCharacterCallApiEvent(
        name: name,
        status: status,
        species: species,
        showLoading: showLoading));
  }

  void _reset() {
    _bloc.add(CharacterResetEvent());
  }

  void _resetFilter() {
    selectedSpices = null;
    selectedState = null;
    _CharacterFilterBloc.selectedSpecies = null;
    _CharacterFilterBloc.selectedStatus = null;
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _getCharacter(
          species: selectedSpices?.value ?? "",
          status: selectedState?.value ?? "",
          name: _searchTextEditingController.text);
    }
  }

  void _favoriteCharacter(Character character) {
    _bloc.add(AddFavoriteCharacterEvent(character: character));
  }

  void _unFavoriteCharacter(int id) {
    _bloc.add(UnFavoriteCharacterEvent(id: id));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
