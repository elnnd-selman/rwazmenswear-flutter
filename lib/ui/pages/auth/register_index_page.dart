import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/register_controller.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/ui/widgets/home/full_button_widget.dart';
import 'package:laraflutter/ui/widgets/text_field_widget.dart';

class RegisterIndexPage extends StatelessWidget {
  const RegisterIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        'Sign Up',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign Up - Your ultimate shopping adventure awaits',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                ...registerController.textFieldDatas
                    .map((e) => e['name'] == 'Country'
                        ? Padding(
                            padding: EdgeInsets.only(top: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        registerController
                                                .countryTextEditController
                                                .text =
                                            country.displayNameNoCountryCode;
                                      },
                                      // Optional. Sets the theme for the country list picker.
                                      countryListTheme: CountryListThemeData(
                                        // Optional. Sets the border radius for the bottomsheet.
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                        // Optional. Styles the search field.
                                        inputDecoration: InputDecoration(
                                          labelText: 'Search',
                                          hintText: 'Start typing to search',
                                          prefixIcon: const Icon(Icons.search),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(0xFF8C98A8)
                                                  .withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                        // Optional. Styles the text in the search field
                                        searchTextStyle: const TextStyle(
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
                                        onPressed: () {}, icon: e['icon']),
                                    controller: e['controller'],
                                  ),
                                ),
                                Obx(
                                  () => registerController
                                              .validationErrors[e['key']] !=
                                          null
                                      ? Text(
                                          registerController
                                              .validationErrors[e['key']]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14.sp),
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          )
                        : e['name'] == 'Phone'
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['name'],
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    // InternationalPhoneNumberInput(
                                    //   onInputChanged: (PhoneNumber number) {},
                                    //   onInputValidated: (bool value) {},
                                    //   selectorConfig: const SelectorConfig(
                                    //     selectorType:
                                    //         PhoneInputSelectorType.BOTTOM_SHEET,
                                    //     useBottomSheetSafeArea: true,
                                    //   ),
                                    //   initialValue: PhoneNumber(
                                    //       phoneNumber: registerController
                                    //           .phoneTextEditController.text,
                                    //       isoCode: 'IQ'),
                                    //   ignoreBlank: false,
                                    //   autoValidateMode:
                                    //       AutovalidateMode.disabled,
                                    //   selectorTextStyle:
                                    //       const TextStyle(color: Colors.black),
                                    //   textFieldController: registerController
                                    //       .phoneTextEditController,
                                    //   inputDecoration: InputDecoration(
                                    //     contentPadding: EdgeInsets.all(20.w),
                                    //     fillColor: Colors.grey.shade200,
                                    //     filled: true,
                                    //     hintText: e['name'],
                                    //     hintStyle: TextStyle(
                                    //         fontSize: 12.sp,
                                    //         color: Colors.grey.shade500),
                                    //     border: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.w),
                                    //       borderSide: BorderSide(
                                    //           color: Colors.transparent,
                                    //           width: 2.w),
                                    //     ),
                                    //     enabledBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.w),
                                    //       borderSide: const BorderSide(
                                    //         color: Colors.transparent,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //     focusedBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.w),
                                    //       borderSide: BorderSide(
                                    //           color: Colors.transparent,
                                    //           width: 2.w),
                                    //     ),
                                    //     errorBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.w),
                                    //       borderSide: BorderSide(
                                    //           color: Colors.transparent,
                                    //           width: 2.w),
                                    //     ),
                                    //     focusedErrorBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.w),
                                    //       borderSide: BorderSide(
                                    //           color: Colors.transparent,
                                    //           width: 2.w),
                                    //     ),
                                    //   ),
                                    //   formatInput: true,
                                    //   keyboardType:
                                    //       const TextInputType.numberWithOptions(
                                    //           signed: true, decimal: true),
                                    //   inputBorder: const OutlineInputBorder(),
                                    //   onSaved: (PhoneNumber number) {
                                    //     print('On Saved: $number');
                                    //   },
                                    // ),
                                    Obx(
                                      () => registerController
                                                  .validationErrors[e['key']] !=
                                              null
                                          ? Text(
                                              registerController
                                                  .validationErrors[e['key']]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14.sp),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.w),
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
                                          hintText: e['name'],
                                          prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: e['icon']),
                                          controller: e['controller'],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => registerController
                                                .validationErrors[e['key']] !=
                                            null
                                        ? Text(
                                            registerController
                                                .validationErrors[e['key']]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14.sp),
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              ))
                    .toList(),
                Obx(
                  () => FullButtonWidget(
                    child: registerController.loadingRegisterButton.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                    onTab: () {
                      registerController.handleRegister();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: const Text('Already Have an account?',
                          style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
