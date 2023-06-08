import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';
import 'controller.dart';


class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo(){
    return Container(
      margin: EdgeInsets.only(top: 100.h,bottom: 80),
      child: Text(
        "Chatty.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 34.sp,
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  Widget _buildThirdPartyLogin(String loginType,String logo){
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(bottom: 15.h),
        width: 295.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset:Offset(0, 1)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: logo==''? MainAxisAlignment.center:MainAxisAlignment.start,
          children: [
            logo==''?Container():Container(
              padding: EdgeInsets.only(left: 40.w,right: 30.w),
              child: Image.asset("assets/icons/${logo}.png"),
            ),
            Text(
              "Sign in with ${loginType}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal
          ),
    
              
    
            )
          ],
        ),
      ),
      onTap: (){
        controller.handleSignIn("Google");
        print("Signed in using google");

      },
   
    );
  }
  Widget _buildOrLogo(){
    return Container(
      margin: EdgeInsets.only(top: 20.h,bottom: 35.h),
      child: Row(children: [
        Expanded(
          child:Divider(
            color:AppColors.primarySecondaryElementText,
            height: 2.h,
            indent: 50.w 
            ,) 
        ),
        Text("  or  "),
        Expanded(
          child:Divider(
            color:AppColors.primarySecondaryElementText,
            height: 2.h,
            endIndent: 50.w 
            ,) 
        ),


      ]),
    );
  }
  Widget _buildSignupWidget(){
    return Column(
              children: [
                Text(
                  "Already have an account",
                  textAlign: TextAlign.center,
                   style: TextStyle(
                   fontSize: 12.sp,
                   color: AppColors.primaryText,
                   fontWeight: FontWeight.normal
                  ),

                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Text(
                    "Sign up here",
                    textAlign: TextAlign.center,
                     style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.normal
                     ),
                
                  ),
                )

              ],
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child:Column(
          children:[
            _buildLogo(),
            _buildThirdPartyLogin("Google","Google"),
            _buildThirdPartyLogin("Facebook","Facebook"),
            _buildThirdPartyLogin("Apple","Apple"),
            _buildOrLogo(),
            _buildThirdPartyLogin("phone number",""),
            SizedBox(height: 35.h,),
            _buildSignupWidget()
            



          ],
          )
        ),
    );
  }
}