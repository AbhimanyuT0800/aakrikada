import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/features/authantication/view/widgets/edit_text_field_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EditMyProfilePage extends StatelessWidget {
  EditMyProfilePage({super.key});
  final nameController = TextEditingController(text: "Aneesh");
  final emailController = TextEditingController(text: "abc0800@gmail.com");
  final phoneController = TextEditingController(text: "9090909009");
  @override
  Widget build(BuildContext context) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          // Gradient header
          Container(
            width: double.infinity,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colorpallets.primary),
                  ),
                  SizedBox(width: 8),
                  Text(
                    lang.myProfile,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colorpallets.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Profile image
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_avathar.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name field
                  EditTextFieldWidget(controller: nameController),

                  const SizedBox(height: 16),

                  // Email field
                  EditTextFieldWidget(controller: emailController),

                  const SizedBox(height: 16),

                  // Phone field
                  EditTextFieldWidget(controller: phoneController),

                  const SizedBox(height: 24),

                  // Update button
                  AuthCommonButton(tittle: 'up', onpressed: () {}),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
