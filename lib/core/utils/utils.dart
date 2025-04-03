import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";

void showSnackBar(
  BuildContext context, {
  required String title,
  TextAlign? textAlign,
}) {
  final SnackBar snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      title,
      maxLines: 2,
      textAlign: textAlign ?? TextAlign.start,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: ThemeColors.clrWhite,
        fontSize: FontSize.fontSize15,
      ),
    ),
    backgroundColor: ThemeColors.clrBlack50,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
