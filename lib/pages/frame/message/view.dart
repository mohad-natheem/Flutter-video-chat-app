import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/message/controller.dart';
import 'package:video_chat_app/pages/frame/welcome/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../common/values/colors.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _headBar(){
    return Container(
      height: 44.h,
      width: 320.w,
      margin: EdgeInsets.only(top: 20.h,bottom: 20.h),
      child: Row(
        children: [
          Stack(
            children: [
              GestureDetector(
                child: Container(
                  height: 44.h,
                  width: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.primarySecondaryBackground,
                    borderRadius: BorderRadius.circular(22.h),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                     blurRadius: 2,
                     spreadRadius: 1,
                     offset: Offset(0, 1)
                    )]
                  ),
                  child: controller.state.head_detail.value.avatar == null?
                  Icon(Icons.person,color: Colors.grey[700],):
                  Text("hi"),
                ),
                onTap: (){
                  controller.goProfile();
                },
              ),
              Positioned(
                height: 14.w,
                right: 0.w,
                bottom: 5.w,
                child:Container(
                  height: 14.w,
                  width: 14.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElementStatus,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                      color: AppColors.primaryElementText,
                      width: 2.w
                    )
                  ),
                ) 
              )
            ],
          )
        ],
      ),

    );
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(),
                )
              ],
            )
          ],
        ),
        
      )
      );
  }
}