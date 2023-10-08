import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_gym/models/users.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Box<Users> hiveBox = Hive.box('users');
//
//year
String year = Jalali.now().year.toString();
//month
String month = Jalali.now().month.toString().length == 1
    ? '0${Jalali.now()}'
    : Jalali.now().month.toString();
//day
String day = Jalali.now().day.toString().length == 1
    ? '0${Jalali.now()}'
    : Jalali.now().day.toString();

//
class Calculate {
  static int index = 0;
  static String today() {
    return '$year/$month/$day';
  }

  static double mToday() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date == today() && value.payment_method == false ||
          value.payment_method == true) {
        result += double.parse(value.amount);
      } else if (value.date == today() && value.payment_method == true ||
          value.payment_method == false) {
        result += double.parse(value.amount);
      }
    }
    return result;
  }

  static double mMonth() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(5, 7) == month &&
              value.payment_method == false ||
          value.payment_method == true) {
        result += double.parse(value.amount);
      } else if (value.date.substring(5, 7) == month &&
              value.payment_method == true ||
          value.payment_method == false) {
        result += double.parse(value.amount);
      }
    }
    return result;
  }

  static double myear() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(0, 4) == year && value.payment_method == false ||
          value.payment_method == true) {
        result += double.parse(value.amount);
      } else if (value.date.substring(0, 4) == year &&
              value.payment_method == true ||
          value.payment_method == false) {
        result += double.parse(value.amount);
      }
    }
    return result;
  }
}
