import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/auth/cubit/auth_cubit.dart';
import 'package:inventory/features/colors/view/add_colors_screen.dart';
import 'package:inventory/features/tags/view/add_tags_screen.dart';
import 'package:inventory/features/units/view/add_units_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreDetailsScreen extends StatefulWidget {
  const MoreDetailsScreen({super.key});

  @override
  State<MoreDetailsScreen> createState() => _MoreDetailsScreenState();
}

class _MoreDetailsScreenState extends State<MoreDetailsScreen> {
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText('Menu', style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddTagsScreen()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset('assets/price-tag.png', height: 28))),
                        const SizedBox(width: 8),
                        AppText('Tags',
                            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddUnitsScreen()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                            height: 28,
                            width: 28,
                            decoration:
                                BoxDecoration(color: Colors.orangeAccent[100], borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: AppText('U',
                                    style:
                                        const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            )),
                        const SizedBox(width: 8),
                        AppText('Units',
                            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddColorsScreen()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                            height: 28,
                            width: 28,
                            decoration:
                                BoxDecoration(color: Colors.orangeAccent[100], borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: AppText('C',
                                    style:
                                        const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            )),
                        const SizedBox(width: 8),
                        AppText('Colors',
                            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  preferences.setString('token', '');
                  BlocProvider.of<AuthCubit>(context).clearTextController();
                  Navigator.pushAndRemoveUntil(
                      context, CupertinoPageRoute(builder: (context) => const WelcomeScreen()), (s) => false);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  'assets/logout.png',
                                  height: 32,
                                ))),
                        const SizedBox(width: 8),
                        const AppText('LogOut', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
