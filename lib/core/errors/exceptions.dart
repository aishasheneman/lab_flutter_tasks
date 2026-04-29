class ServerException implements Exception {
  final String message;
  
  ServerException({this.message = "حدث خطأ في الخادم"});
}

class CacheException implements Exception {
  final String message;
  
  CacheException({this.message = "حدث خطأ في الكاش"});
}

class NetworkException implements Exception {
  final String message;
  
  NetworkException({this.message = "لا يوجد اتصال بالانترنت"});
}