import 'package:dio/dio.dart';

String handleDioError(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout) {
    return "Connection Timeout. Please try again.";
  } else if (e.type == DioExceptionType.receiveTimeout) {
    return "Server took too long to respond.";
  } else if (e.type == DioExceptionType.badResponse) {
    final statusCode = e.response?.statusCode;
    final message = e.response?.data['message'] ?? 'Something went wrong';
    return "Error $statusCode: $message";
  } else if (e.type == DioExceptionType.unknown) {
    return "No Internet Connection.";
  } else {
    return "Unexpected error occurred.";
  }
}
