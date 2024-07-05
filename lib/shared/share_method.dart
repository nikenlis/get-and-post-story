
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_moa/shared/theme.dart';


void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    borderRadius: BorderRadius.circular(24),
    duration: const Duration(seconds: 2),
  ).show(context);
}
