import 'package:get/get.dart';
import 'package:video_chat_app/common/routes/names.dart';
import 'package:video_chat_app/pages/frame/welcome/state.dart';

class WelcomeController extends GetxController{
  WelcomeController();
  final title ="Chatty .";
  final state = WelcomeState();

  @override
  void onReady(){
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),()=>Get.offAllNamed(AppRoutes.Message));
     
  }
} 