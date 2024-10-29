import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText('Search', style: TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
