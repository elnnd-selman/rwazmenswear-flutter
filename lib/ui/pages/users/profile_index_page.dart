import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                            .map((e) => e['name'] == 'Country'
                                ? Padding(
                                    padding: EdgeInsets.only(top: 20.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['name'],
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showCountryPicker(
                                              context: context,
                                              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                              favorite: <String>['IQ'],
                                              //Optional. Shows phone code before the country name.
                                              showPhoneCode: false,
                                              onSelect: (Country country) {
                                                profileController
                                                        .countryTextEditController
                                                        .text =
                                                    country
                                                        .displayNameNoCountryCode;
                                              },
                                              // Optional. Sets the theme for the country list picker.
                                              countryListTheme:
                                                  CountryListThemeData(
                                                // Optional. Sets the border radius for the bottomsheet.
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(40.0),
                                                  topRight:
                                                      Radius.circular(40.0),
                                                ),
                                                // Optional. Styles the search field.
                                                inputDecoration:
                                                    InputDecoration(
                                                  labelText: 'Search',
                                                  hintText:
                                                      'Start typing to search',
                                                  prefixIcon:
                                                      const Icon(Icons.search),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: const Color(
                                                              0xFF8C98A8)
                                                          .withOpacity(0.2),
                                                    ),
                                                  ),
                                                ),
                                                // Optional. Styles the text in the search field
                                                searchTextStyle:
                                                    const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            );
                                          },
                                          child: TextFieldWidget(
                                            enabled: false,
                                            hintText: e['name'],
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              size: 30.sp,
                                            ),
                                            prefixIcon: IconButton(
                                                onPressed: () {},
                                                icon: e['icon']),
                                            controller: e['controller'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : e['name'] == 'Phone'
                                    ? SizedBox()
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                              controller: e['controller'],
                                            ),

                                            //VERIFY TEXT
                                            e['name'] == 'Email' &&
                                                    !profileController
                                                        .isEmailVerified
                                                        .value &&
                                                    profileController
                                                        .emailVerificationMessage
                                                        .value
                                                        .isEmpty
                                                ? Row(
                                                    children: [
                                                      //TEXT
                                                      Text(
                                                        'Verify email please.',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.red),
                                                      ),
                                                      //BUTTON
                                                      TextButton(
                                                        onPressed: () {
                                                          profileController
                                                              .sendEmailVerification();
                                                        },
                                                        child: profileController
                                                                .loadingSendVerificationEmailButton
                                                                .value
                                                            ? SizedBox(
                                                                width: 20.w,
                                                                height: 20.w,
                                                                child:
                                                                    const CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      3,
                                                                  color: Colors
                                                                      .blue,
                                                                ))
                                                            : const Text(
                                                                'Verify email',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                      )
                                                    ],
                                                  )
                                                : const SizedBox(),

                                            //VERIFY SENT TEXT
                                            e['name'] == 'Email' &&
                                                    profileController
                                                        .emailVerificationMessage
                                                        .value
                                                        .isNotEmpty
                                                ? Obx(
                                                    () => profileController
                                                            .emailVerificationMessage
                                                            .value
                                                            .isNotEmpty
                                                        ? Text(
                                                            profileController
                                                                .emailVerificationMessage
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize:
                                                                    14.sp),
                                                          )
                                                        : const SizedBox(),
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
