import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/home_screen.dart';
import 'package:inventory/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
// TODO: add flutter_svg package to pubspec.yaml

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  goToLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token') ?? '';
    if (token.trim().isNotEmpty) {
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
        );
      });
    } else {
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const SignInScreen()),
              (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: screenWidth > 600
              ? Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: AspectRatio(aspectRatio: 1, child: Image.asset('assets/inventory.jpg')),
              ),
              ErrorInfo(
                title: "Hello and Welcome",
                description: "We're setting things up for you. This will only take a moment.",
                press: () {},
              ),
            ],
          )
              : Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(aspectRatio: 1, child: Image.asset('assets/inventory.jpg')),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "Hello and Welcome",
                description: "We're setting things up for you. This will only take a moment.",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16 * 2.5),
            button ?? const SizedBox(),
            /* ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Text(btnText ?? "Retry".toUpperCase()),
                ),*/
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
