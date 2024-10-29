import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_text.dart';

class ChipWidget extends StatelessWidget {
  final Widget? icon;
  final String text;
  final double? width;
  final Function(String) onSelected;
  final Color color;

  const ChipWidget(
      {super.key,
      this.icon,
      required this.text,
      this.width = 90.0,
      required this.onSelected,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(text);
      },
      child: Container(
        // width: width,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(width: 1.0, color: const Color(0xFFE4E4E7))),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  AppText(
                    text,
                    style: const TextStyle().defaultTextStyle(),
                  )
                ],
              )
            : AppText(
                text,
                maxLines: 5,
                style: const TextStyle().defaultTextStyle(),
              ),
      ),
    );
  }
}
