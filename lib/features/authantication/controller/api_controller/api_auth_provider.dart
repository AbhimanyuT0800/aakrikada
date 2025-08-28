import 'dart:developer';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/view/pages/my_bottom_navigation_widget.dart';
import 'package:aakrikada/features/authantication/services/api_auth_services.dart';
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
  Future<void> verifyOtp({
    required String phn,
    required String otp,
    required BuildContext context,
  }) async {
    state = true;
    try {
      final resp = await ApiAuthServices().verifyOtpService(phn, otp);

      // if responce has data navigate to otp verification section
      if (resp != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyBottomNavigationWidget()),
        );
        // login sucess snak bar after navigate to home page
        showAppSnakBar('Login Successful', Colorpallets.greenColor);
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
}
