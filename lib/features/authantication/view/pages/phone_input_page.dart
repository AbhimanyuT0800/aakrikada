import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/view/pages/otp_verification_page.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    //language provider
    final lang = AppLocalizations.of(context)!;

    //  controller for phone text field
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
            AuthCommonButton(
              tittle: lang.continueTo,
              onpressed: () {
                final phone = phoneController.text.trim();

                if (phone.isEmpty ||
                    phone.length != 10 ||
                    !RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
                  showAppSnakBar(lang.phnNbrError);
                } else {
                  // Phone number is valid → navigate to next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationPage(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
