import 'package:intl/intl.dart';

class GlobalClass {
  static String timeAgoFunction(DateTime d) {
    //* <-- DateTime Show Method
    Duration diff = DateTime.now().difference(d);

    if (diff.inDays > 0) return DateFormat('d MMM y').format(d);

    if (diff.inHours > 0) if (DateFormat.yMd().format(d) ==
        DateFormat.yMd().format(DateTime.now())) {
      return "Today, ${DateFormat('jm').format(d)}";
    } else {
      return DateFormat('d MMM y').format(d);
    }
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  static String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
