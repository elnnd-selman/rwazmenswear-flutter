import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/constant/images.dart';
import 'package:laraflutter/ui/widgets/home/full_button_widget.dart';
import 'package:laraflutter/ui/widgets/text_field_widget.dart';

class LoginIndexPage extends StatelessWidget {
  const LoginIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
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
                        'Sign In',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign In - Your ultimate shopping adventure awaits',
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
                      controller: loginController.email,
                    ),
                    Obx(
                      () => loginController.validationErrors['email'] != null
                          ? Text(
                              loginController.validationErrors['email']
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.sp),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Obx(
                      () => TextFieldWidget(
                        hintText: 'Password',
                        obscureText: loginController.visiblePassword.value,
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginController.visiblePassword.value =
                                  !loginController.visiblePassword.value;
                            },
                            icon: Icon(!loginController.visiblePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        keyboardType: TextInputType.visiblePassword,
                        controller: loginController.password,
                      ),
                    ),
                    Obx(
                      () => loginController.validationErrors['password'] != null
                          ? Text(
                              loginController.validationErrors['password']
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.sp),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                Obx(
                  () => FullButtonWidget(
                    child: loginController.loginButtonLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                    onTab: () {
                      loginController.handleLogin();
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Have not an account yet?',
                        style: TextStyle(color: Colors.grey)),
                    Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.grey),
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
