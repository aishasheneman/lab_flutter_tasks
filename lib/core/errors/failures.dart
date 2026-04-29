abstract class Failure {
  final String message;
  
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String message="فشل الخادم"]): super(message);
}

class CacheFailure extends Failure {
  CacheFailure([String message="فشل في الكاش"]): super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message="فشل في الانترنت"]): super(message);
}

