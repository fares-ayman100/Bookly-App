import 'package:dio/dio.dart';

abstract class Failuer {
  final String errMessage;
  Failuer(this.errMessage);
}

class ServerError extends Failuer {
  ServerError(super.errMessage);
  factory ServerError.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerError('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerError('Recive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerError('Error in Certification , Try Again');
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerError('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerError('Error in Connection ,try again');
      case DioExceptionType.unknown:
        return ServerError('Unexpected Error,Please try later!');
    }
  }
  factory ServerError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your request not found ,Please try later!');
    } else {
      return ServerError('Oops, there was an error. Please try again');
    }
  }
}
