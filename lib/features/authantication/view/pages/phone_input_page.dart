import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_auth_provider.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneInputPage extends ConsumerWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //language provider
    final lang = AppLocalizations.of(context)!;

    //  controller for phone text field
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
                  lang.hiThere,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colorpallets.primary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Card with content
          Padding(padding: const EdgeInsets.symmetric(horizontal: 24)),
          Text(
            lang.welcomeMessage,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Phone Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colorpallets.blueColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colorpallets.blueColor),
                ),
                labelText: lang.phoneNbr,
                hintText: lang.enterPhnNbr,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Spacer(),

          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: AuthCommonButton(
              tittle: lang.continueTo,
              onpressed: () {
                final phone = phoneController.text.trim();

                if (phone.isEmpty ||
                    phone.length != 10 ||
                    !RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
                  showAppSnakBar(lang.phnNbrError, Colorpallets.blackColor);
                } else {
                  // Phone number is valid -- sent otp logic

                  ref
                      .watch(apiAuthProvider.notifier)
                      .verifyUser(phn: phone, context: context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
