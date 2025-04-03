import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.onPressed,
    required this.title,
    this.margin,
    this.padding,
    this.borderRadius,
    this.isLarge = false,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    super.key,
    this.side = BorderSide.none,
  });

  final String title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isLarge;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide side;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Container(
    margin: (margin != null) ? margin : EdgeInsets.zero,
    child:
        isLarge
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Expanded(child: getElevatedButton(context))],
            )
            : getElevatedButton(context),
  );

  Widget getElevatedButton(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: ThemeColors.clrTransparent,
      backgroundColor: backgroundColor ?? ThemeColors.clrPrimary,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      alignment: Alignment.center,
    ),
    onPressed: onPressed,
    child: Text(
      title,
      maxLines: 1,
      style:
          textStyle ??
          TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: FontSize.fontSizeRegular,
            fontWeight: FontWeight.w500,
            color: textColor ?? ThemeColors.clrWhite,
          ),
    ),
  );
}
