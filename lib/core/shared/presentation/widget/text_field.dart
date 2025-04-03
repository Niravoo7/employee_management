import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    required this.controller,
    this.focusNode,
    this.paddingOfTitle = EdgeInsets.zero,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.hint,
    this.isObscureText = false,
    this.isReadOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.isStarOnHint = false,
    this.keyboardType = TextInputType.text,
    this.onSuffix,
    this.onPrefix,
    this.onChanges,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.matchPasswordText,
    this.validator,
    this.textInputFormatter,
    this.errorText,
    this.maxLine,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hint;
  final bool isObscureText;
  final bool isReadOnly;
  final bool enabled;
  final bool autofocus;
  final bool isStarOnHint;
  final Function()? onSuffix;
  final Function()? onPrefix;
  final Function(String)? onChanges;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? suffixIcon;
  final IconData? prefixIcon;
  final String? title;
  final String? matchPasswordText;
  final Color? fillColor;
  final EdgeInsetsGeometry paddingOfTitle;
  final List<TextInputFormatter>? textInputFormatter;
  final String? errorText;
  final int? maxLine;
  final Function()? onEditingComplete;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final FocusNode _focus = FocusNode();
  final BorderRadius borderRadius = BorderRadius.circular(4);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus,
      scrollPadding: const EdgeInsets.only(bottom: 40),
      textCapitalization: TextCapitalization.sentences,
      obscureText: widget.isObscureText,
      focusNode: widget.focusNode ?? _focus,
      enabled: widget.enabled,
      readOnly: widget.isReadOnly,
      inputFormatters: widget.textInputFormatter,
      maxLines: widget.maxLine,
      style: const TextStyle(
        fontSize: FontSize.fontSizeMedium,
        fontWeight: FontWeight.w400,
        color: ThemeColors.clrBlack50,
      ),
      cursorColor: ThemeColors.clrBlack,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      onEditingComplete: widget.onEditingComplete,
      onChanged: (String data) {
        if (widget.onChanges != null) {
          widget.onChanges!(data);
        }
        // validate(data);
      },
      keyboardAppearance: isDark ? Brightness.dark : Brightness.light,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: FontSize.fontSizeMedium,
          color: ThemeColors.clrGray100,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: widget.fillColor ?? ThemeColors.clrTransparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.fillColor != null
                    ? ThemeColors.clrTransparent
                    : widget.errorText != null && widget.errorText!.isNotEmpty
                    ? ThemeColors.clrError
                    : ThemeColors.clrPrimary,
          ),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.fillColor != null
                    ? ThemeColors.clrTransparent
                    : widget.errorText != null && widget.errorText!.isNotEmpty
                    ? ThemeColors.clrError
                    : ThemeColors.clrWhite100,
          ),
          borderRadius: borderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.fillColor != null
                    ? ThemeColors.clrTransparent
                    : ThemeColors.clrWhite100,
          ),
          borderRadius: borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.fillColor != null
                    ? ThemeColors.clrTransparent
                    : ThemeColors.clrError,
          ),
          borderRadius: borderRadius,
        ),
        prefixIcon:
            widget.prefixIcon != null
                ? Icon(
                  widget.prefixIcon!,
                  size: 25,
                  color: ThemeColors.clrPrimary,
                )
                : null,
        suffixIcon:
            widget.suffixIcon != null
                ? UnconstrainedBox(
                  child: InkWell(
                    onTap: widget.onSuffix,
                    child: Image.asset(
                      widget.suffixIcon!,
                      height: 24,
                      width: 24,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? widget.isObscureText
                                  ? ThemeColors.clrWhite.withValues(alpha: 0.5)
                                  : ThemeColors.clrWhite
                              : widget.isObscureText
                              ? ThemeColors.clrDisable
                              : ThemeColors.clrBlack,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
