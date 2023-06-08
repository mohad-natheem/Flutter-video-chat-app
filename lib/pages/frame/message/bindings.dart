import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/message/controller.dart';

class MessageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }

}