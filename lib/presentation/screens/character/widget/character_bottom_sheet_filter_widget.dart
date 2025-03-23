import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/domain/entity/character/character_filter/character_filter.dart';
import 'package:rick/domain/entity/lookup.dart';
import 'package:rick/presentation/blocs/character_filter/character_filter_bloc.dart';
import 'package:rick/presentation/widgets/custom_gradient_button_widget.dart';

class CharacterBottomSheetFilter extends StatefulWidget {
  const CharacterBottomSheetFilter({super.key});

  @override
  State<CharacterBottomSheetFilter> createState() =>
      _CharacterBottomSheetFilterState();
}

class _CharacterBottomSheetFilterState
    extends State<CharacterBottomSheetFilter> {
  CharacterFilterBloc get _bloc =>
      BlocProvider.of<CharacterFilterBloc>(context);

  CharacterFilter characterFilter = CharacterFilter(status: [], species: []);

  @override
  void initState() {
    _bloc.add(CharacterFilterGetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterFilterBloc, CharacterFilterState>(
      listener: (context, state) {
        if (state is CharacterFilterGetDataState) {
          characterFilter = state.characterFilter;
        } else if (state is CharacterFilterSelectStatusState) {
          characterFilter.status = state.status;
        } else if (state is CharacterFilterSelectSpeciesState) {
          characterFilter.species = state.species;
        } else if (state is CharacterFilterApplyFilterState) {
          Navigator.pop(context, characterFilter);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorManager.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                child: Row(
                  children: characterFilter.status
                      .map((e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: FilterChip(
                              label: Text(
                                e.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: ColorManager.black),
                              ),
                              selected: e.isSelected,
                              selectedColor: ColorManager.primary,
                              showCheckmark: false,
                              onSelected: (value) {
                                _selectStatus(e);
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Species",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorManager.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                child: Row(
                  children: characterFilter.species
                      .map((e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: FilterChip(
                              label: Text(
                                e.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: ColorManager.black),
                              ),
                              selected: e.isSelected,
                              selectedColor: ColorManager.primary,
                              showCheckmark: false,
                              onSelected: (value) {
                                _selectSpecies(e);
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              CustomGradientButtonWidget(
                onTap: () {
                  _applyFilter();
                },
                text: "Apply Filter",
              )
            ],
          ),
        );
      },
    );
  }

  void _selectStatus(Lookup status) {
    _bloc.add(CharacterFilterSelectStatusEvent(status: status));
  }

  void _selectSpecies(Lookup species) {
    _bloc.add(CharacterFilterSelectSpeciesEvent(species: species));
  }

  void _applyFilter() {
    _bloc
        .add(CharacterFilterApplyFilterEvent(characterFilter: characterFilter));
  }
}
