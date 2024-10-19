import 'package:flutter/material.dart';

class KeyboardUtils {
  void hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}