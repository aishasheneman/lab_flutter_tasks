

import 'package:bader_app_project/core/errors/exceptions.dart';
import 'package:bader_app_project/core/errors/failures.dart';

class ErrorHandle {
  static Failure handle(Exception e){
    if (e is ServerException){
      return ServerFailure(e.message);
    } else if (e is CacheException){
      return CacheFailure(e.message);
    } else if (e is NetworkException) {
      return NetworkFailure(e.message);
    } else{
     return ServerFailure("$e");
    }
  }
}

//  طريقة الاستخدام في الريبوستري
// try {
//   // كود جلب البيانات من السيرفر
// } on ServerException catch (e) {
//   // هنا نستخدم كلاس المعالجة الخاص بك
//   return Left(ErrorHandle.handle(e)); 
// }