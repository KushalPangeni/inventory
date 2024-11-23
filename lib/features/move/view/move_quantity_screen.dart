import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/core/keyboard_utils.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'move_reason_screen.dart';

class MoveQuantityScreen extends StatefulWidget {
  final folder_model.Folder selectedFolder;
  final folder_model.Folder destinationFolder;

  const MoveQuantityScreen({super.key, required this.selectedFolder, required this.destinationFolder});

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
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    child: Image.asset(
                      'assets/folder.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AppText(widget.selectedFolder.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  AppText('  --->  '),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    child: Image.asset(
                      'assets/folder.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AppText(widget.destinationFolder.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                  context,
                  CupertinoPageRoute(
                      builder: (context) => MoveReasonScreen(
                          selectedFolder: widget.selectedFolder, destinationFolder: widget.destinationFolder)));
            }),
      ),
    );
  }
}
