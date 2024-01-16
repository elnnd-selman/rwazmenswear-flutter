import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/logout_controller.dart';
import 'package:laraflutter/application/controllers/user_controllers.dart/profile_controller.dart';
import 'package:laraflutter/ui/layouts/page_navbar_layout.dart';
import 'package:laraflutter/ui/widgets/text_field_widget.dart';

class ProfileIndexPage extends StatelessWidget {
  const ProfileIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    LogoutController logoutController = Get.find();
    LoginController loginController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Obx(
            () => profileController.profile.value.name == null
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => PageNavbarLayout(
                            title: profileController.isProfileEdit.value
                                ? "Profile Edit"
                                : 'Profile',
                            actionTitle: profileController.isProfileEdit.value
                                ? profileController.loadingEditButton.value
                                    ? 'Saving...'
                                    : 'Save'
                                : 'Edit',
                            onActionTab: () async {
                              profileController.handleEditProfile();
                            },
                          ),
                        ),
                        ...profileController.textFieldDatas
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['name'],
                                        style: TextStyle(fontSize: 14.sp),
                                      ),
                                      TextFieldWidget(
                                          enabled: profileController
                                              .isProfileEdit.value,
                                          hintText: e['name'],
                                          prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: e['icon']),
                                          controller: e['controller']),
                                      e['name'] == 'Email'
                                          ? Text(
                                              loginController
                                                          .loginInformations
                                                          .value
                                                          .emailVerifiedAt ==
                                                      null
                                                  ? 'Verify email please'
                                                  : loginController
                                                      .loginInformations
                                                      .value
                                                      .emailVerifiedAt
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.red),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ))
                            .toList(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.w),
                          child: Row(
                            children: [
                              logoutController.loadingLogoutButton.value
                                  ? Padding(
                                      padding: EdgeInsets.all(15.0.w),
                                      child: SizedBox(
                                        width: 20.w,
                                        height: 20.w,
                                        child: const CircularProgressIndicator(
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              TextButton.icon(
                                  onPressed: () {
                                    logoutController.handleLogout();
                                  },
                                  icon: Icon(
                                    Icons.logout_outlined,
                                    color: Colors.red,
                                    size: 17.sp,
                                  ),
                                  label: const Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
