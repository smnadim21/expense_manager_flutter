import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
abstract class CustomResponse<T> {
  String? errorMessage;
  bool? isSuccessful;
  bool? loginNotVerified;
  DateTime? responseTime;
  T? result;

  Request? request;
  Map<String, String>? headers;
  int? statusCode;
  String? statusText;
  bool hasError = true;
  bool isOk = false;
  bool unauthorized = true;
  Stream<List<int>>? bodyBytes;
  String? bodyString;
  dynamic? body;

// CustomResponse(
//     {this.errorMessage,
//     this.isSuccessful,
//     this.loginNotVerified,
//     this.responseTime,
//     this.result});
}

class DefaultResponse<T> extends CustomResponse<T> {
  DefaultResponse.from(Response<dynamic> response) {
    request = response.request;
    headers = response.headers;
    statusCode = response.statusCode;
    statusText = response.statusText;
    hasError = response.hasError;
    isOk = response.isOk;
    isSuccessful = response.isOk;
    unauthorized = response.unauthorized;
    loginNotVerified = !response.unauthorized;
    bodyBytes = response.bodyBytes;
    bodyString = response.bodyString;
    body = response.body;

  }
}
