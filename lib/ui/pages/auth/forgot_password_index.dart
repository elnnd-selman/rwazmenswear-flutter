import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/forgot_password_controller.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/constant/images.dart';
import 'package:laraflutter/ui/widgets/home/full_button_widget.dart';
import 'package:laraflutter/ui/widgets/text_field_widget.dart';

class ForgotPasswordIndexPage extends StatelessWidget {
  const ForgotPasswordIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotPasswordController =
        ForgotPasswordController();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.w,
                ),
                Image.asset(
                  AppImages.logo,
                  width: 100.w,
                ),
                SizedBox(
                  height: 50.w,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Enter your email address to send reset password link',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextFieldWidget(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: forgotPasswordController.email,
                    ),
                    Obx(
                      () => forgotPasswordController
                                  .validationErrors['email'] !=
                              null
                          ? Text(
                              forgotPasswordController.validationErrors['email']
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.sp),
                            )
                          : const SizedBox(),
                    ),
                    Obx(
                      () => forgotPasswordController.message.value.isNotEmpty
                          ? Text(
                              forgotPasswordController.message.value.toString(),
                              style: TextStyle(
                                  color: Colors.green, fontSize: 14.sp),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                  ],
                ),
                Obx(
                  () => FullButtonWidget(
                    child: forgotPasswordController.sendEmailButtonLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Send Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                    onTab: () {
                      forgotPasswordController.handleSendEmail();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('login');
                      },
                      child: const Text(
                        'Sign In',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
