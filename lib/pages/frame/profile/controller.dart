import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_chat_app/common/routes/names.dart';
import 'package:video_chat_app/common/store/user.dart';
import 'package:video_chat_app/pages/frame/profile/state.dart';
import 'package:video_chat_app/pages/frame/welcome/state.dart';

class ProfileController extends GetxController{
  ProfileController();
  final title ="Chatty .";
  final state = ProfileState();

  Future<void> gotoLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }

     
  
} 