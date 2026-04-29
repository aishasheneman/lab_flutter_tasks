import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class NetworkInfo {
  
  Future<bool> get isConnected async {
    // 1. التحقق الأولي من وجود اتصال بالهاردوير (Wi-Fi/Mobile)
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }

    // 2. التحقق الفعلي من تدفق البيانات (بينج حقيقي)
    try {
      // نقوم بإرسال طلب HEAD (خفيف جداً) مع مهلة زمنية 3 ثوانٍ فقط
      final response = await http.get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        return true; // الإنترنت يعمل فعلياً
      } else {
        return false; // متصل بالشبكة ولكن لا توجد بيانات (Captive Portal مثلاً)
      }
    } catch (_) {
      // في حال حدوث Timeout أو خطأ في الشبكة
      return false;
    }
  }
}


 