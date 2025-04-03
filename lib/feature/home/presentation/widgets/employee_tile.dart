import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({required this.index, super.key});

  final int index;
  @override
  Widget build(BuildContext context) => Dismissible(
    key: Key(index.toString()),
    direction: DismissDirection.endToStart,
    onDismissed: (DismissDirection direction) {},

    background: const SizedBox.shrink(),
    secondaryBackground: Container(
      padding: const EdgeInsets.only(right: 20),
      color: ThemeColors.clrError,
      alignment: Alignment.centerRight,
      child: const ImageIcon(
        AssetImage(IconConstants.icDelete),
        color: ThemeColors.clrWhite,
        size: 28,
      ),
    ),
    child: const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: <Widget>[
          Text(
            "name",
            style: TextStyle(
              fontSize: FontSize.fontSizeMedium,
              fontWeight: FontWeight.w500,
              color: ThemeColors.clrBlack50,
            ),
          ),
          Text(
            "job role",
            style: TextStyle(
              fontSize: FontSize.fontSizeRegular,
              color: ThemeColors.clrGray100,
            ),
          ),
          Text(
            "time",
            style: TextStyle(
              fontSize: FontSize.fontSizeSmall,
              color: ThemeColors.clrGray100,
            ),
          ),
        ],
      ),
    ),
  );
}
