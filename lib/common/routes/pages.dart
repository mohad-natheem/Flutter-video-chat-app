import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/welcome/index.dart';
import 'package:video_chat_app/pages/frame/message/index.dart';
import 'package:video_chat_app/pages/frame/profile/index.dart';


import '../../pages/frame/sign_in/bindings.dart';
import '../../pages/frame/sign_in/view.dart';
import '../middlewares/router_auth.dart';
import 'names.dart';

class AppPages{
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes =[
    GetPage(
      name: AppRoutes.INITIAL ,
      page: () => const WelcomePage(),
      binding: WelcomeBinding()
    ),

    GetPage(name: AppRoutes.Message,
    page: ()=> const MessagePage(),
    binding: MessageBinding(),middlewares: [
      RouteAuthMiddleware(priority:1),
      ],),

    GetPage(name: AppRoutes.SIGN_IN,
     page: ()=>const SignInPage(),
     binding: SignInBinding(),
     ),

     GetPage(name: AppRoutes.Profile,
     page: () => const ProfilePage(),
     binding: ProfileBinding()
     )  ];
}