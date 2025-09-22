import 'dart:developer';
import 'dart:typed_data';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/services/pick_image_services.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_auth_provider.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/user_upadate_request_model.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/features/authantication/view/widgets/edit_text_field_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditMyProfilePage extends ConsumerStatefulWidget {
  const EditMyProfilePage({super.key});

  @override
  ConsumerState<EditMyProfilePage> createState() => _EditMyProfilePageState();
}

class _EditMyProfilePageState extends ConsumerState<EditMyProfilePage> {
  final nameController = TextEditingController(text: "Aneesh");
  final emailController = TextEditingController(text: "abc0800@gmail.com");
  final phoneController = TextEditingController(text: "9090909009");

  Uint8List? imageData;

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
                  const SizedBox(width: 8),
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
                  const SizedBox(height: 20),
                  // Profile image
                  InkWell(
                    onTap: () async {
                      // if (await Permission.photos.request().isGranted &&
                      //     await Permission.storage.request().isGranted &&
                      //     await Permission.camera.request().isGranted) {
                      //   // Both permissions are granted

                      final data = await PickImageServices().pickFromGallery();
                      log(data.toString());
                      if (data != null) {
                        setState(() => imageData = data);
                      } else {
                        showAppSnakBar('Try Again', Colorpallets.redColor);
                      }
                      // } else {
                      //   // Handle the case where permissions are not granted
                      // }
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: imageData != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                imageData!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset('assets/images/img_avathar.jpg'),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name field
                  EditTextFieldWidget(controller: nameController),

                  const SizedBox(height: 16),

                  // Email field
                  EditTextFieldWidget(controller: emailController),

                  const SizedBox(height: 24),

                  // Update button
                  AuthCommonButton(
                    tittle: 'up',
                    onpressed: () {
                      //
                      if (imageData != null) {
                        final profileImg = PickupProfileImage(
                          image: imageData!,
                        );
                        ref
                            .watch(apiAuthProvider.notifier)
                            .updateProfileDetails(
                              model: UserUpdateRequestModel(
                                userId: int.parse(
                                  ref
                                      .read(storeUserIdProvider.notifier)
                                      .getUserid()!,
                                ),
                                name: nameController.text,
                                email: emailController.text,
                                userImage: profileImg.toJson(),
                              ),
                              context: context,
                            );
                      } else {
                        showAppSnakBar(
                          'Choose profile',
                          Colorpallets.blackColor,
                        );
                      }
                    },
                  ),
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
