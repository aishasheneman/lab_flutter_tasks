import 'package:intl/intl.dart';

String formatSmartDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inMinutes < 60) {
    return "منذ ${difference.inMinutes} دقيقة";
  } else if (difference.inHours < 24) {
    return "منذ ${difference.inHours} ساعة";
  } else if (difference.inDays == 1) {
    return "أمس في ${DateFormat('hh:mm a').format(date)}";
  } else if (difference.inDays < 7) {
    return "منذ ${difference.inDays} أيام";
  } else {
    // إذا مر أكثر من أسبوع، يعرض التاريخ الكامل
    return DateFormat('yyyy/MM/dd').format(date);
  }
}