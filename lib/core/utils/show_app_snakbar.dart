import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/main.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnakBar(
  String message,
) {
  return MainApp.scaffoldMessngerKey.currentState!.showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colorpallets.blackColor),
  );
}
