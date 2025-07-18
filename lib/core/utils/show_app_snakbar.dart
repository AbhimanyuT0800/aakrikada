import 'package:aakrikada/main.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnakBar(
  String message,
  Color color,
) {
  return MainApp.scaffoldMessngerKey.currentState!.showSnackBar(
    SnackBar(content: Text(message), backgroundColor: color),
  );
}
