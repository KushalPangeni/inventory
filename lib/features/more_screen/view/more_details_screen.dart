import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_text.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppText(
          'More',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
