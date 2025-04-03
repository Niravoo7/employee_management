import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/core/shared/presentation/widget/action_button.dart";
import "package:assignment/core/shared/presentation/widget/text_field.dart";
import "package:assignment/feature/home/presentation/widgets/common_input_date.dart";
import "package:assignment/feature/home/presentation/widgets/select_role_sheet.dart";
import "package:flutter/material.dart";

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(StringConstants.strAddEmployeeDetails)),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                spacing: 20,
                children: <Widget>[
                  CommonTextField(
                    controller: TextEditingController(),
                    prefixIcon: Icons.person_outline_sharp,
                    hint: StringConstants.strEmployeeName,
                    textInputAction: TextInputAction.done,
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        builder: (BuildContext context) => SelectRoleSheet(),
                      );
                    },
                    contentPadding: const EdgeInsets.only(left: 12),
                    dense: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: ThemeColors.clrWhite100),
                    ),
                    leading: const ImageIcon(
                      AssetImage(IconConstants.icBag),
                      size: 25,
                      color: ThemeColors.clrPrimary,
                    ),
                    title: const Text(
                      StringConstants.strSelectRole,
                      style: TextStyle(
                        fontSize: FontSize.fontSizeMedium,
                        color: ThemeColors.clrGray100,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                      color: ThemeColors.clrPrimary,
                    ),
                  ),
                  const Row(
                    spacing: 20,
                    children: <Widget>[
                      CommonInputDate(date: StringConstants.strToday),
                      ImageIcon(
                        AssetImage(IconConstants.icArrowRight),
                        color: ThemeColors.clrPrimary,
                      ),
                      CommonInputDate(date: StringConstants.strNoDate),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: ThemeColors.clrWhite,
            shape: const Border(
              top: BorderSide(color: ThemeColors.clrWhite50, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 20,
                children: <Widget>[
                  ActionButton(
                    onPressed: () {},
                    title: StringConstants.strCancel,
                    backgroundColor: ThemeColors.clrSecondary,
                    textColor: ThemeColors.clrPrimary,
                  ),
                  ActionButton(
                    onPressed: () {},
                    title: StringConstants.strSave,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
