import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";

class SelectRoleBottomSheet extends StatelessWidget {
  const SelectRoleBottomSheet({required this.selectedJobRole, super.key});

  final Function(String) selectedJobRole;

  @override
  Widget build(BuildContext context) => ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: employeeRoleList.length,
    itemBuilder:
        (BuildContext context, int index) => InkWell(
          onTap: () {
            selectedJobRole(employeeRoleList[index]);
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              employeeRoleList[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: FontSize.fontSizeMedium,
                color: ThemeColors.clrBlack50,
              ),
            ),
          ),
        ),
    separatorBuilder:
        (BuildContext context, int index) =>
            const Divider(height: 0, color: ThemeColors.clrWhite50),
  );
}
