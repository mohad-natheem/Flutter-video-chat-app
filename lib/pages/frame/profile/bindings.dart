import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/welcome/controller.dart';

import 'controller.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}