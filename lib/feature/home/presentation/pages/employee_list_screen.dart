import "package:assignment/core/constants/image_constants.dart";
import "package:assignment/core/constants/string_constants.dart";
import "package:assignment/core/constants/theme_constants.dart";
import "package:assignment/feature/home/presentation/widgets/employee_item.dart";
import "package:assignment/routes/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ThemeColors.clrWhite50,
    appBar: AppBar(title: const Text(StringConstants.strEmployeeList)),
    body:
        true
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    ImageConstants.imgNoData,
                    height: 170.h,
                    fit: BoxFit.fill,
                  ),
                  const Text(
                    StringConstants.strNoRecordsFound,
                    style: TextStyle(
                      fontSize: FontSize.fontSizeLarge,
                      color: ThemeColors.clrBlack50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
            : Container(
              color: ThemeColors.clrWhite,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder:
                    (BuildContext context, int index) =>
                        EmployeeItem(index: index),
                separatorBuilder:
                    (BuildContext context, int index) =>
                        const Divider(height: 0, color: ThemeColors.clrWhite50),
              ),
            ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addDetailsRoute);
      },
      child: const Icon(Icons.add, size: 32),
    ),
  );
}
