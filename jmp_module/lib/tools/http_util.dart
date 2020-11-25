import 'package:dio/dio.dart';
import 'app_manage.dart';
import 'dart:convert';

class HttpUtil {
  // ignore: non_constant_identifier_names
  final String GET = 'GET';

  // ignore: non_constant_identifier_names
  final String POST = 'POST';

  // ignore: non_constant_identifier_names
  final String PUT = 'PUT';

  // ignore: non_constant_identifier_names
  final String DELETE = 'DELETE';

  /*取消token*/
  CancelToken _cancelToken;

  /*网络请求对象*/
  Dio _dio;

  /*网络请求配置*/
  BaseOptions _options;

  /*单例模式*/
  factory HttpUtil() => _sharedInstance();

  static HttpUtil get instance => _sharedInstance();
  static HttpUtil _instance;

  HttpUtil._() {
    _cancelToken = CancelToken();
    _options = BaseOptions(
      /*15s 超时时间*/
      connectTimeout: 15000,
      receiveTimeout: 15000,
        responseType: ResponseType.json
    );
    _dio = Dio(_options);
  }


  static HttpUtil _sharedInstance() {
    if (_instance == null) {
      _instance = HttpUtil._();
    }
    return _instance;
  }

  /*get请求*/
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic> params}) async {
    return _request(url,
        method: GET, params: params);
  }

  /*post请求*/
  Future<Map<String, dynamic>> post(String url,
      {Map<String, dynamic> params}) async {
    return _request(url,
        method: POST, params: params);
  }

  /*put请求*/
  Future<Map<String, dynamic>> put(String url,
      {Map<String, dynamic> params}) async {
    return _request(url,
        method: PUT, params: params);
  }

  /*delete请求*/
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic> params}) async {
    return _request(url,
        method: DELETE, params: params);
  }


  /*请求部分*/
  Future<Map<String, dynamic>> _request(String url,
      {String method,
        Map<String, dynamic> params}) async {
    int statusCode;
    Response response;

    try {
//      _dio.options.headers["HC-ACCESS-TOKEN"] = AppUtil.instance.getUserToken();
//      if (AppUtil.instance.deviceUuid != null) {
//        _dio.options.headers["HC-ACCESS-UUID"] = AppUtil.instance.deviceUuid;
//      }


      if(AppManage.instance.header.isNotEmpty) {
        print(AppManage.instance.baseUrl.toString());
        AppManage.instance.header.forEach((key, value) {
          
          print("$key---$value");
          _dio.options.headers[key] = value;
        });
        
      }
       
      _dio.options.baseUrl = AppManage.instance.baseUrl;
      if (_cancelToken.isCancelled) {
        _cancelToken = CancelToken();
      }

      print(url);
      print(params);
      if (method == GET) {

        response = await _dio.get(url,
            queryParameters: params, cancelToken: _cancelToken);
      } else if (method == POST) {
        response = await _dio.post(url,
            queryParameters: params, cancelToken: _cancelToken);
      } else if (method == PUT) {
        response = await _dio.put(url,
            queryParameters: params, cancelToken: _cancelToken);
      } else if (method == DELETE) {
        response = await _dio.delete(url,
            queryParameters: params, cancelToken: _cancelToken);
      }
      print(response);

     // statusCode = response.statusCode;
      //处理错误部
//      if (statusCode != 200) {
//        return Future.error(response.statusMessage);
//      }
//      bool isMap = response.data is Map;
//      if (!isMap) {
//        return Future.error("请求失败");
//      }

     // response 转为 map类型
     Map<String,dynamic> map = jsonDecode(response.toString());
      //处理接口返回失败情况
      if (map.containsKey("returncode")) {
        int code = int.parse(map["returncode"]);
        if (code == 0 ) {
          print('请求成功回调');
          //成功
          return Future.value(map);
        }else {
          print('请求失败回调');
          return Future.error(map["returnmsg"]);
        }
      }else {
        return Future.error("请求失败");
      }

    } catch (exception) {
      if (!(exception is DioError)) {
        return Future.error(exception.toString());
      }else {
        return Future.error("请求失败");
      }
    }
  }

  /*取消所有请求*/
  void cancelAll() {
    if (_cancelToken.isCancelled) {
      _cancelToken = CancelToken();
    } else {
      _cancelToken.cancel("cancelled");
    }
  }



}