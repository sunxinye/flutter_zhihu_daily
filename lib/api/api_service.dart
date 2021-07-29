import 'base_api_service.dart';

class ApiService extends BaseApiService {

  @override
  void init() {
    options.inte
  }

}

class CommonResponseData extends BaseResponseData{
  @override
  bool get isSuccess => code == 200;

  CommonResponseData.fromJson(Map<String,dynamic> jsonData){
    code = jsonData["code"];
    message = jsonData["message"];
    data = jsonData["data"];
  }
}
