import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_chat_app/common/entities/user.dart';
import 'package:video_chat_app/common/routes/names.dart';
import 'package:video_chat_app/common/store/user.dart';
import 'package:video_chat_app/common/utils/http.dart';
import 'package:video_chat_app/pages/frame/sign_in/state.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController{
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid'
    ]

  );

  Future<void> handleSignIn(String type) async {
    //1.email 2.google 3.facebook 4.apple 5.phone number

    try{
      if(type=="phone number"){
        if (kDebugMode) {
          print("...you are logging in with phone number..");
        }
      }else if(type == "Google"){
        var user =await _googleSignIn.signIn();
        if(user!=null){
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl?? "assets/icons/Google.png";

          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.email=email;
          loginPanelListRequestEntity.openid=id;
          loginPanelListRequestEntity.type=2;
          asyncPostAllData();
        }

      }else{
        if (kDebugMode) {
          print("...login type not sure...");
        }
      }

      

    }catch(e){
      if (kDebugMode) {
        print("..error with logging in $e");
      }

    }
  }

  asyncPostAllData()async{

  //  var response = HttpUtil().get(
  //   '/api/index'
  //  );
  //  print(response);
   UserStore.to.setIsLogin=true;
    Get.offAllNamed(AppRoutes.Message);
  }

} 