import 'package:get/get.dart';
import 'package:video_chat_app/common/routes/names.dart';
import 'package:video_chat_app/pages/frame/message/index.dart';

class MessageController extends GetxController{
  MessageController();
  final state = MessageState();

  void goProfile() async{
    await Get.toNamed(AppRoutes.Profile);

  }

} 