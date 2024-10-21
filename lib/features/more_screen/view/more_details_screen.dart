import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/tags/view/add_tags_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Divider(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (context) => const AddTagsScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AppText('Tags', style: TextStyle(fontSize: 18)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
