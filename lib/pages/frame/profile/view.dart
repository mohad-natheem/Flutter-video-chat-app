import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_chat_app/pages/frame/profile/controller.dart';



import '../../../common/values/colors.dart';

class ProfilePage extends GetView<ProfileController> {

  const ProfilePage({super.key});

  AppBar buildAppBar() {
    return AppBar(
        title: Text("Profile",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
          ),),
      );
  }

  Widget _buildProfilePhoto(){
    return Stack(
      alignment: Alignment.center,
      children:[
        Container(
        height: 120.w,
        width: 120.w,
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryBackground,
          borderRadius: BorderRadius.circular(60.w),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0,1)
          )]
    
        ),
        child: Icon(Icons.person,
        color: Colors.black.withOpacity(0.4),
        size: 60,),
      ),
        Positioned(
          bottom: 5.w,
          right: 0.w,
          child:Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(35.w)
            ),
            child: Icon(Icons.edit_outlined,color: Colors.white,),
          )

          )
      ]
    );
  }

  Widget _buildCompleteBtn(){

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 60.w,bottom: 30.w),
        height:44.w,
        width: 295.w,
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5.w),
           boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0,1)
          )]

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Complete",
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10.w,bottom: 30.w),
        height:44.w,
        width: 295.w,
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.circular(5.w),
           boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0,1)
          )]

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logout",
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal
            ),)
          ],
        ),
      ),
      onTap: (){
        Get.defaultDialog(
          title:"Are you sure to logout?",
          textConfirm: "Confirm",
          textCancel: "Cancel",
          content: Container(),
          onConfirm: (){
            controller.gotoLogout();

          },
          onCancel: () {
            
          },

        );
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:SafeArea(
        child:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfilePhoto(),
                    _buildCompleteBtn(),
                    _buildLogoutButton()

                  ],
                ),
              )
            )
          ],
        )
        )
    );
  }
}