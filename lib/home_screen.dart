import 'package:flutter/material.dart';
import 'package:inventory/features/history/history_screen.dart';
import 'package:inventory/folders_list_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/main.dart';

import 'features/menu_screen/view/menu_details_screen.dart';
import 'features/search/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  List screens = const [FoldersListScreen(), HistoryScreen(), SearchScreen(), MoreDetailsScreen()];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: screenWidth < 600
          ? ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (context, int index, _) {
                return screens[index];
              })
          : Row(
              children: [
                Container(
                    width: 200,
                    color: Colors.black.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 10),
                          AppText('Inventory System',
                              style: const TextStyle().defaultTextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          bottomNavBarWidget(0, Image.asset('assets/folder.png', height: 36), 'Folders'),
                          bottomNavBarWidget(1, Image.asset('assets/history.png', height: 36), 'History'),
                          bottomNavBarWidget(2, Image.asset('assets/search.png', height: 36), 'Search'),
                          bottomNavBarWidget(3, Image.asset('assets/menu.png', height: 36), 'Menu'),
                          const SizedBox(width: 2),
                        ],
                      ),
                    )),
                Expanded(
                  child: ValueListenableBuilder<int>(
                      valueListenable: _selectedIndex,
                      builder: (context, int index, _) {
                        return screens[index];
                      }),
                )
              ],
            ),
      bottomNavigationBar: screenWidth < maxScreenWidth
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 2),
                Expanded(child: bottomNavBarWidget(0, Image.asset('assets/folder.png', height: 24), 'Folders')),
                const SizedBox(width: 2),
                Expanded(child: bottomNavBarWidget(1, Image.asset('assets/history.png', height: 24), 'History')),
                const SizedBox(width: 2),
                Expanded(child: bottomNavBarWidget(2, Image.asset('assets/search.png', height: 24), 'Search')),
                const SizedBox(width: 2),
                Expanded(child: bottomNavBarWidget(3, Image.asset('assets/menu.png', height: 24), 'Menu')),
                const SizedBox(width: 2),
              ],
            )
          : null,
    );
  }

  Widget bottomNavBarWidget(int index, Widget icon, String label) {
    return InkWell(
      onTap: () {
        _selectedIndex.value = index;
      },
      child: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, selectedIndex, _) => Container(
          width: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: MediaQuery.sizeOf(context).width < maxScreenWidth
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon,
                      const SizedBox(height: 8),
                      AppText(label,
                          style: const TextStyle()
                              .defaultTextStyle(fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.w400))
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon,
                      const SizedBox(width: 8),
                      AppText(label,
                          style: const TextStyle()
                              .defaultTextStyle(fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.w400))
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
