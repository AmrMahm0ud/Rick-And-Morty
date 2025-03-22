import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:rick/core/base/widget/base_stateful_widget.dart';
import 'package:rick/core/resources/image_paths.dart';
import 'package:rick/presentation/screens/character/character_screen.dart';
import 'package:rick/presentation/screens/favorite_character/favorite_character_screen.dart';

class MainScreen extends BaseStatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _navigationItems = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _pages = [
      const CharacterScreen(),
      const FavoriteCharacterScreen(),
    ];
    _navigationItems = [
      _item(
        label: "Characters",
        icon: ImagePaths.home,
      ),
      _item(
        label: "Favorites",
        icon: ImagePaths.favorite,
      ),
    ];
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _pages.isEmpty
          ? Container(
              height: 20,
            )
          : Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                items: _navigationItems,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: ColorManager.primary,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                unselectedItemColor: ColorManager.iconColor,
                backgroundColor: ColorManager.white,
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: ColorManager.background),
                selectedLabelStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: ColorManager.primary),
                onTap: (index) => setState(() => _onItemTapped(index)),
              ),
            ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _item({
    required String label,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(2),
        child: SvgPicture.asset(icon),
      ),
      label: label,
      activeIcon: Padding(
        padding: const EdgeInsets.all(2),
        child: SvgPicture.asset(
          icon,
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
