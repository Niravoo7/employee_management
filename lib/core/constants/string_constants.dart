import "package:assignment/feature/manage_employee/presentation/widgets/common_calendar_picker.dart";

class MapConstant {
  static const String mapEmployeeList = "employeeList";
}

// Project constant text
class StringConstants {
  static const String appName = "Assignment";
  static const String strEmployeeList = "Employee List";
  static const String strNoRecordsFound = "No employee records found";
  static const String strAddEmployeeDetails = "Add Employee Details";
  static const String strEmployeeName = "Employee name";
  static const String strSelectRole = "Select role";
  static const String strProductDesigner = "Product Designer";
  static const String strFlutterDeveloper = "Flutter Developer";
  static const String strQATester = "QA Tester";
  static const String strProductOwner = "Product Owner";
  static const String strToday = "Today";
  static const String strNoDate = "No date";
  static const String strSave = "Save";
  static const String strCancel = "Cancel";
  static const String strNextMonday = "Next Monday";
  static const String strNextTuesday = "Next Tuesday";
  static const String strAfterWeek = "After 1 week";
  static const String strCurrentEmployees = "Current employees";
  static const String strPreviousEmployees = "Previous employees";
  static const String strSwipeLeftDelete = "Swipe left to delete";
  static const String strEmployeeDataHasBeenDeleted =
      "Employee data has been deleted";
  static const String strUndo = "Undo";
  static const String strEditEmployeeDetails = "Edit Employee Details";
  static const String strFrom = "From";
  static const String strEmployeeNameRequired = "Employee name required!";
  static const String strEmployeeJobPostRequired =
      "Employee job post required!";
  static const String strInvalidEmployeeName =
      "Name can only contain letters, spaces!";
  static const String strInvalidDates =
      "Start date cannot be later than the end date!";
}

String getDatePickerItemString(DatePickerItem datePickerItem) {
  switch (datePickerItem) {
    case DatePickerItem.noDate:
      return StringConstants.strNoDate;
    case DatePickerItem.today:
      return StringConstants.strToday;
    case DatePickerItem.nextMonday:
      return StringConstants.strNextMonday;
    case DatePickerItem.nextTuesday:
      return StringConstants.strNextTuesday;
    case DatePickerItem.after1Week:
      return StringConstants.strAfterWeek;
  }
}

final List<String> employeeRoleList = <String>[
  StringConstants.strProductDesigner,
  StringConstants.strFlutterDeveloper,
  StringConstants.strQATester,
  StringConstants.strProductOwner,
];
