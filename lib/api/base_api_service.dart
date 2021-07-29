import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:isolate/isolate_runner.dart';
import 'package:isolate/load_balancer.dart';


Map<String,dynamic> _parseAndDecode(String response) {
  return jsonDecode(response);
}

Future<LoadBalancer> loadBalancer = LoadBalancer.create(4, IsolateRunner.spawn);

parseJson(String text) async {
  final lb = await loadBalancer;
  return lb.run<Map<String,dynamic>, String>(_parseAndDecode, text);
}

abstract class BaseApiService extends DioForNative {
  BaseApiService() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    init();
  }

  void init();
}

abstract class BaseResponseData{
  int code;
  String message;
  dynamic data;

  bool get isSuccess;

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}