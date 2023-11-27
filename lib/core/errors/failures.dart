import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeOut with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeOut with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeOut with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate timeOut with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure('BadResponse timeOut with ApiServer');
      case DioExceptionType.cancel:
        return ServerFailure('Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure('ConnectionError timeOut with ApiServer');
      case DioExceptionType.unknown:
        return ServerFailure('UnKnown Error');
    }
  }
}
