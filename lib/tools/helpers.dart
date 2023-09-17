import 'package:hospital/main.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

String customDateFormat(String? date) {
  if (date == null) return "";
  if (date.isEmpty) return "";
  List tmp = [];
  tmp.addAll(date.split(" ").first.split("-").reversed);
  logger.d(tmp);
  tmp.insert(0, tmp[1]);
  tmp.removeAt(2);
  return DateFormat.yMMMMEEEEd()
      .format(DateFormat.yMd().parse(tmp.join("/")))
      .toString();
}
