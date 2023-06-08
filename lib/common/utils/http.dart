import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_chat_app/common/store/user.dart';

import '../values/server.dart';
import '../values/storage.dart';

class HttpUtil{
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal(){
    
    BaseOptions options = BaseOptions(
      baseUrl :SERVER_API_URL,

      // connectTimeout:,

      // receiveTimeout:5000,

      headers:{},

      contentType: 'application/json; charset=utf-8',

      responseType:ResponseType.json,
    );

    dio = new Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=
    (HttpClient client) {
      client.badCertificateCallback =
      (X509Certificate cert ,String host,int port) => true;
      return client;
    };

    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options,handler){

        return handler.next(options);
      },
      onResponse: (response,handler){

        return handler.next(response);

      },
      // onError: (DioError e,handler){
      //   Loading.dismiss();
      //   ErrorEntity eInfo = createErrorEntity(e);
      //   onError(eInfo);
      //   return handler.next(e);
  //}
    ));
  }

  // void onError(ErrorEntity eInfo){
  //   print('error code -> '+
  //   eInfo.code.toString() +
  //   ', error.message ->' +
  //   eInfo.message);
  //   switch(eInfo.code){
  //     case 401:
  //     UserStore.to.onLogout();
  //     EasyLoading.showError(eInfo.message);
  //     break;
  //     default:
  //     EasyLoading.showError('Error');
  //     break;
  //   }
  //  }

  //  ErrorEntity createErrorEntity(DioError error){
  //   switch(error.type){
  //     case DioErrorType.cancel:
  //     return ErrorEntity(code:-1,message:"Cancel error");
  //     case DioErrorType.connectionTimeout:
  //     return ErrorEntity(code:-1,message:"Connection timeout");
  //     case DioErrorType.sendTimeout:
  //     return ErrorEntity(code:-1,message:"sendtimeout error");
  //     case DioErrorType.receiveTimeout:
  //     return ErrorEntity(code:-1,message:"Receive Timeout error");
  //     case DioErrorType.response:
  //     {
  //       try{
  //         int errCode = 
  //         error.response != null ?.error.response!.statusCode! : -1;

  //         switch(errCode){
  //           case 400:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 401:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 402:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 403:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 404:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 405:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 500:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 502:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 503:
  //           return ErrorEntity(code:errCode,message:"");
  //            case 505:
  //           return ErrorEntity(code:errCode,message:"");
  //           default :
  //           {
  //             return ErrorEntity(
  //               code:errCode,
  //               message:error.response != null
  //               ? error.response!.statusMessage!
  //               :"",             
  //               );
  //           }

  //         }
  //       }on Exception catch(_){
  //         return ErrorEntity(code:-1,message:"");
  //       }
  //     }
  //     default:
  //     {
  //       return ErrorEntity(code:-1,message:error.message);
  //     }
  //   }
  //  }

   void cancelRequests(CancelToken token){
    token.cancel("cancelled");
   }

   Map<String,dynamic>?getAuthorizationHeader(){
    var headers =<String,dynamic>{};
    if(Get.isRegistered<UserStore>() && UserStore.to.hasToken==true){
      headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    }
    return headers;
   }

  Future get(
    String path,{
    Map<String,dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey ='',
    bool cacheDisk = false,

})async{
  Options requestOptions = options ?? Options();
  requestOptions.extra ??= Map();
  requestOptions.extra!.addAll({
    "refresh":refresh,
    "noCache":noCache,
    "list":list,
    "cacheKey":cacheKey,
    "cacheDisk":cacheDisk,
  });
  requestOptions.headers = requestOptions.headers ?? {};
  Map<String,dynamic>? authorization = getAuthorizationHeader();
  if(authorization != null){
    requestOptions.headers!.addAll(authorization);
  }

  var response = await dio.get(
    path,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );
  return response.data;
  }
  }

