import 'dart:developer';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_auth_provider.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpVerificationPage extends ConsumerWidget {
  const OtpVerificationPage({super.key, required this.phn});

  final String phn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    String otp = '0000';

    // otp controllers

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
              onSubmit: (value) {
                log(value);
                otp = value;
              },

              keyboardType: TextInputType.number,
              numberOfFields: 6,
              borderColor: Colorpallets.primary,
              fieldWidth: 40,
              borderRadius: BorderRadius.circular(8),
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
                  //  OTP resend option

                  ref
                      .watch(apiAuthProvider.notifier)
                      .resendOtp(phn: phn, context: context);
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
                log(otp);
                // otp verification method and navigation logic
                ref
                    .watch(apiAuthProvider.notifier)
                    .verifyOtp(phn: phn, otp: otp, context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
