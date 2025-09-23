import 'dart:developer';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/view/pages/my_bottom_navigation_widget.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/otp_verified_model.dart';
import 'package:aakrikada/features/authantication/domain/model/user_upadate_request_model.dart';
import 'package:aakrikada/features/authantication/services/api_auth_services.dart';
import 'package:aakrikada/features/authantication/services/shared_pref_service.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_profile_page.dart';
import 'package:aakrikada/features/authantication/view/pages/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_auth_provider.g.dart';

@riverpod
class ApiAuth extends _$ApiAuth {
  @override
  bool build() {
    return false;
  }

  // verify user provider
  Future<void> verifyUser({
    required String phn,
    required BuildContext context,
  }) async {
    state = true;
    try {
      final resp = await ApiAuthServices().verifyUser(phn: phn);

      // if responce has data navigate to otp verification section
      if (resp != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationPage(phn: phn),
          ),
        );
      } else {
        showAppSnakBar(
          'Something went wrong... Try again',
          Colorpallets.blackColor,
        );
      }
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
  }

  // verify OTP provider
  Future<OtpVerifyModel?> verifyOtp({
    required String phn,
    required String otp,
    required BuildContext context,
  }) async {
    state = true;
    try {
      final resp = await ApiAuthServices().verifyOtpService(phn, otp);

      // if responce has data navigate to home page section
      if (resp != null) {
        if (resp.data.name.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditMyProfilePage()),
          );
        } else {
          final userData = UserDetails(
            email: resp.data.email,
            img: resp.data.userimage,
            name: resp.data.name,
          );
          SharedPrefService.updateUserDetails(userData);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyBottomNavigationWidget()),
          );
        }

        // login sucess snak bar after navigate to home page
        showAppSnakBar('Login Successful', Colorpallets.greenColor);

        return resp;
      } else {
        showAppSnakBar(
          'Something went wrong... Try again',
          Colorpallets.blackColor,
        );
      }
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
    return null;
  }

  // resend OTP provider
  Future<void> resendOtp({
    required String phn,

    required BuildContext context,
  }) async {
    log(phn);
    state = true;
    try {
      final resp = await ApiAuthServices().resendOtpService(phn);

      // if responce has data navigate to otp verification section
      if (resp != null) {
        showAppSnakBar('OTP sent successfuly', Colorpallets.greenColor);
      } else {
        showAppSnakBar(
          'Something went wrong... Try again',
          Colorpallets.blackColor,
        );
      }
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
  }

  // update profile info provider
  Future<void> updateProfileDetails({
    required UserUpdateRequestModel model,

    required BuildContext context,
  }) async {
    state = true;
    try {
      final resp = await ApiAuthServices().updateProfile(model);

      // if responce has data navigate store id on shares pref
      // and navigate to home paage
      if (resp != null) {
        final userData = UserDetails(
          email: resp.data.email,
          img: resp.data.userimage,
          name: resp.data.name,
        );
        SharedPrefService.updateUserDetails(userData);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyBottomNavigationWidget()),
        );
        showAppSnakBar(resp.message, Colorpallets.greenColor);
        SharedPrefService.addUserId(resp.data.id);
      } else {
        showAppSnakBar(
          'Something went wrong... Try again',
          Colorpallets.blackColor,
        );
      }
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
  }
}
