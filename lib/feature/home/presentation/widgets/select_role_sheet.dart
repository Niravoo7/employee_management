import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:flutter/material.dart";

class SelectRoleSheet extends StatelessWidget {
  SelectRoleSheet({super.key});

  final List<String> employeeRoleList = <String>[
    StringConstants.strProductDesigner,
    StringConstants.strFlutterDeveloper,
    StringConstants.strQATester,
    StringConstants.strProductOwner,
  ];

  @override
  Widget build(BuildContext context) => ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: employeeRoleList.length,
    itemBuilder:
        (BuildContext context, int index) => InkWell(
          onTap: () {},
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
