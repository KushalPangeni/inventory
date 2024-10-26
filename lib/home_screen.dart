import 'package:flutter/material.dart';
import 'package:inventory/folders_list_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'features/menu_screen/view/menu_details_screen.dart';
import 'features/search/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  List screens = const [FoldersListScreen(), SearchScreen(), MoreDetailsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, int index, _) {
              return screens[index];
            }),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 2),
            Expanded(child: bottomNavBarWidget(0, const Icon(Icons.folder_open_rounded), 'Folders')),
            const SizedBox(width: 2),
            Expanded(child: bottomNavBarWidget(1, const Icon(Icons.search_rounded), 'Search')),
            const SizedBox(width: 2),
            Expanded(child: bottomNavBarWidget(2, const Icon(Icons.menu), 'Menu')),
            const SizedBox(width: 2),
          ],
        ));
  }

  Widget bottomNavBarWidget(int index, Widget icon, String label) {
    return InkWell(
      onTap: () {
        _selectedIndex.value = index;
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [icon, AppText(label)],
          ),
        ),
      ),
    );
  }
}
