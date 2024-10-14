import 'package:flutter/material.dart';
import 'package:inventory/folders_list_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'features/more_screen/view/more_details_screen.dart';
import 'features/search/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  List screens = const [FoldersListScreen(), SearchScreen(), MoreDetailsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, int index, _) {
              return screens[index];
            }),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                bottomNavBarWidget(0, const Icon(Icons.folder), 'Folders'),
                bottomNavBarWidget(1, const Icon(Icons.search_rounded), 'Search'),
                bottomNavBarWidget(2, const Icon(Icons.menu), 'Menu'),
              ],
            ),
          ),
        ));
  }

  Widget bottomNavBarWidget(int index, Widget icon, String label) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          _selectedIndex.value = index;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [icon, AppText(label)],
        ),
      ),
    );
  }
}
