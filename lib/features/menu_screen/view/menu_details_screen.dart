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
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Menu', style: TextStyle(fontSize: 20)),
            Divider(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
                            decoration:
                                BoxDecoration(color: Colors.orangeAccent[100], borderRadius: BorderRadius.circular(4)),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.tag_rounded,
                                size: 28,
                              ),
                            )),
                        const SizedBox(width: 8),
                        const AppText('Tags', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
