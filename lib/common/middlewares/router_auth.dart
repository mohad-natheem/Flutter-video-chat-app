import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../routes/names.dart';
import '../store/user.dart';

class RouteAuthMiddleware extends GetMiddleware{
  @override
  // TODO: implement priority
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route){
    if(UserStore.to.isLogin || route==AppRoutes.SIGN_IN ||route == AppRoutes.INITIAL){
      return null;
      
    }else{
      Future.delayed(
        const Duration(seconds: 2),() => Get.snackbar("Tips","Login expired , please login again !")
      );
      return const RouteSettings(name:AppRoutes.SIGN_IN);
    }
  }
}