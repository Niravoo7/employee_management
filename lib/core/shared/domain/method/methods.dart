import "package:assignment/core/constants/image_constants.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

/// PreLoading the Images and Icons into the system cache for faster loading
void preLoadImages(BuildContext context) {
  for (final String image in ImageConstants.imageList) {
    precacheImage(AssetImage(image), context);
  }
  for (final String icon in IconConstants.iconList) {
    precacheImage(AssetImage(icon), context);
  }
}

final DateFormat formatToDateMonthYear = DateFormat("dd MMM yyyy");
