import 'dart:developer';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/view/pages/my_bottom_navigation_widget.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          // Gradient Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  lang.verifyOtp,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colorpallets.primary,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            child: OtpTextField(
              keyboardType: TextInputType.number,
              numberOfFields: 6,
              borderColor: Colorpallets.primary,
              fieldWidth: 40,
              borderRadius: BorderRadius.circular(8),
              onCodeChanged: (String code) {
                //TODO
                log(code);
              },
            ),
          ),
          SizedBox(height: 12),
          // resent OTP method
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 32, vertical: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // TODO
                },
                child: Text(
                  lang.resendOtp,
                  style: TextStyle(color: Colorpallets.blueColor),
                ),
              ),
            ),
          ),
          Spacer(flex: 4),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 18),
            child: AuthCommonButton(
              tittle: lang.verify,
              onpressed: () {
                // TODO otpverification method and navigation logic

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBottomNavigationWidget(),
                  ),
                );
                // show green snak bar after login
                showAppSnakBar(lang.loginSuccess, Colorpallets.greenColor);
              },
            ),
          ),
        ],
      ),
    );
  }
}
