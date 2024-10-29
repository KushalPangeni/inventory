import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/core/keyboard_utils.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'move_reason_screen.dart';

class MoveQuantityScreen extends StatefulWidget {
  const MoveQuantityScreen({super.key});

  @override
  State<MoveQuantityScreen> createState() => _MoveQuantityScreenState();
}

class _MoveQuantityScreenState extends State<MoveQuantityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppText('Move Folder', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.orangeAccent[100]),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), color: Colors.orange),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                        child: Icon(Icons.file_open_outlined, size: 50),
                      )),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText('Items 1',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.folder_outlined),
                          SizedBox(width: 4),
                          AppText('Folder 1', style: TextStyle(fontSize: 14))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            const AppText('Quantity to Move', style: TextStyle(fontSize: 20)),
            Align(
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                controller: TextEditingController(),
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.teal),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            const AppText('of 700 units', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: AppText(
                  'Move All',
                  style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
            title: 'Next',
            color: Colors.orangeAccent,
            onPressed: () {
              KeyboardUtils().hideKeyBoard();
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => const MoveReasonScreen()));
            }),
      ),
    );
  }
}
