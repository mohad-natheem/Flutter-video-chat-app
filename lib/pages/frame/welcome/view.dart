import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/welcome/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../common/values/colors.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});
 
 Widget _buildPageHeadTitle(String title){
  return Container(
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 45.sp
      ),
          ),

  );
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Container(
        width: 360.w,
        height: 780.h,
        margin: EdgeInsets.only(top: 360),
        child: _buildPageHeadTitle(controller.title),
      ),
    );
  }
}