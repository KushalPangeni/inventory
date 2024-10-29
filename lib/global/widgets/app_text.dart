
import 'package:flutter/material.dart';
extension TextStylingExtension on TextStyle {
  TextStyle defaultTextStyle({
    double? fontSize = 14,
    FontWeight? fontWeight = FontWeight.w500,
    double height = 0,
    double? letterSpacing,
    Color color = Colors.black,
    TextDecoration decoration = TextDecoration.none,
    String? family = 'Mulish',
  }) {
    return TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
        color: color,
        decoration: decoration,
        fontFamily: family,
        fontWeight: fontWeight);
  }
}

class AppText extends StatelessWidget {
  const AppText(this.text,
      {super.key,
        this.textAlign = TextAlign.start,
        this.maxLines = 1,
        this.style,
        this.onTextPressed,
        this.overflow = TextOverflow.ellipsis});

  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final Function()? onTextPressed;
  final TextOverflow overflow;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle = const TextStyle().defaultTextStyle();
    final TextStyle mergedStyle =
    style != null ? defaultStyle.merge(style) : defaultStyle;
    return InkWell(
      onTap: onTextPressed,
      child: Text(text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: mergedStyle),
    );
  }
}
