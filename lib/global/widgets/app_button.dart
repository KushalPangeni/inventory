import 'package:flutter/material.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function() onPressed;
  final Color color;
  final double height;
  final Color? borderColor;
  final bool isDisabled;
  final Widget? icon;

  const AppButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isDisabled = false,
      this.isLoading = false,
      this.color = Colors.grey,
      this.borderColor,
      this.icon,
      this.height = 54});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      disabledColor: Colors.grey[700],
      color:isDisabled ? Colors.grey[400]: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      height: height,
      onPressed: () {
        if (!isDisabled) {
          onPressed();
        }
      },
      child: isLoading
          ? const SizedBox(
              height: 35,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: 4)],
                AppText(
                  title,
                  style: const TextStyle().defaultTextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
    );
  }
}
