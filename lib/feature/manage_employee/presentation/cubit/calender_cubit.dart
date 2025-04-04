import "package:assignment/core/utils/date_utils.dart";
import "package:assignment/feature/manage_employee/presentation/cubit/calender_state.dart";
import "package:assignment/feature/manage_employee/presentation/widgets/common_calendar_picker.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:table_calendar/table_calendar.dart";

class CalenderParams {
  late DateTime selectedDate;
  late DatePickerItem selectedDatePickerItem = DatePickerItem.today;
}

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());

  late CalenderParams calenderParams = CalenderParams();

  void setSelectedDate(DateTime selectedDate) {
    emit(CalenderInitial());
    calenderParams.selectedDate = selectedDate;
    setDatePickerItem();
    emit(CalenderModified(calenderParams));
  }

  void setSelectedDateFromDatePickerItem(DatePickerItem datePickerItem) {
    emit(CalenderInitial());
    switch (datePickerItem) {
      case DatePickerItem.noDate:
        calenderParams.selectedDate = DateTime(0);
        break;
      case DatePickerItem.today:
        calenderParams.selectedDate = DateTime.now();
        break;
      case DatePickerItem.nextMonday:
        calenderParams.selectedDate = nextMonday();
        break;
      case DatePickerItem.nextTuesday:
        calenderParams.selectedDate = nextTuesday();
        break;
      case DatePickerItem.after1Week:
        calenderParams.selectedDate = afterOneWeek();
        break;
    }
    setDatePickerItem();
    emit(CalenderModified(calenderParams));
  }

  void setDatePickerItem() {
    if (isToday(calenderParams.selectedDate)) {
      calenderParams.selectedDatePickerItem = DatePickerItem.today;
    } else if (isSameDay(nextMonday(), calenderParams.selectedDate)) {
      calenderParams.selectedDatePickerItem = DatePickerItem.nextMonday;
    } else if (isSameDay(nextTuesday(), calenderParams.selectedDate)) {
      calenderParams.selectedDatePickerItem = DatePickerItem.nextTuesday;
    } else if (isSameDay(afterOneWeek(), calenderParams.selectedDate)) {
      calenderParams.selectedDatePickerItem = DatePickerItem.after1Week;
    } else {
      calenderParams.selectedDatePickerItem = DatePickerItem.noDate;
    }
  }
}
