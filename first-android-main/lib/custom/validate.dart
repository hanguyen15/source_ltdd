import 'package:intl/intl.dart';

// ignore: camel_case_types
class CusTom_Validate {
  static bool isDate(String str) {
    try {
      var inputFomat = DateFormat('dd/MM/yy');
      // ignore: unused_local_variable
      var date = inputFomat.parseStrict(str);
      return true;
    } catch (e) {
      return false;
    }
  }
}
