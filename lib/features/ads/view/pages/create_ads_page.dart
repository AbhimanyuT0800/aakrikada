import 'dart:typed_data';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/controller/api_ads_provider.dart';
import 'package:aakrikada/features/ads/domain/create_ads_request_model.dart';
import 'package:aakrikada/features/ads/services/pick_image_services.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_address_provider.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_address_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAdPage extends ConsumerWidget {
  const CreateAdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // language provider
    final lang = AppLocalizations.of(context)!;
    // image data binary file
    Uint8List? imageData;

    // item category
    int? categoryCount;

    // summary controller
    TextEditingController summaryController = TextEditingController();
    // itemCount controller
    TextEditingController itemCountController = TextEditingController();
    // priority
    String? priority;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.createAd,
          style: TextStyle(color: Colorpallets.primary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colorpallets.primary),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFFDFFFEF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            Center(
              child: InkWell(
                // get image data from gallery
                onTap: () async {
                  final data = await PickImageServices().pickFromGallery();
                  if (data != null) {
                    imageData = data;
                  } else {
                    showAppSnakBar('Try Again', Colorpallets.redColor);
                  }
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Icon(Icons.camera_alt_outlined, size: 30),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(lang.selectCategory),
            SizedBox(height: 4),

            // drop down for select category
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(8),
              dropdownColor: Colorpallets.grey50Color,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colorpallets.blackColor,
              ),
              items: [
                DropdownMenuItem(value: '1', child: Text(lang.iron)),
                DropdownMenuItem(value: '2', child: Text(lang.newsPaper)),
                DropdownMenuItem(value: '3', child: Text(lang.electrolic)),
                DropdownMenuItem(value: '4', child: Text(lang.plastic)),
                DropdownMenuItem(value: '5', child: Text(lang.others)),
              ],
              onChanged: (value) {
                categoryCount = int.parse(value ?? '1');
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Summary
            Text(lang.summary),
            SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: lang.briefSummary,
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),

            // nbr of Items
            Text(lang.approxNbr),
            SizedBox(height: 4),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Priority
            Text(lang.priority),
            SizedBox(height: 4),
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(8),
              dropdownColor: Colorpallets.grey50Color,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colorpallets.blackColor,
              ),

              items: [
                DropdownMenuItem(value: 'high', child: Text(lang.high)),
                DropdownMenuItem(value: 'medium', child: Text(lang.medium)),
                DropdownMenuItem(value: 'low', child: Text(lang.low)),
              ],
              onChanged: (value) {
                priority = value;
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 24),

            // User Information
            Text(
              lang.userInfo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              tileColor: Colors.green[50],
              leading: CircleAvatar(
                backgroundColor: Colorpallets.greenColor,
                child: Icon(Icons.map, color: Colorpallets.whiteColor),
              ),
              title: Text(lang.chooseAdress),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                // choose address from saved address
                final addessData = await ref
                    .watch(apiAddressProvider.notifier)
                    .getAddress(
                      ref.read(storeUserIdProvider.notifier).getUserid()!,
                    );

                // Nvigate to my address page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditMyAddressPage(addressModel: addessData),
                  ),
                );
              },
            ),
            SizedBox(height: 8),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              tileColor: Colors.orange[50],
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.access_time, color: Colorpallets.whiteColor),
              ),
              title: Text(lang.preferrrdPickup),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // pick up time config
              },
            ),
            SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .watch(apiAdsProvider.notifier)
                      .createAds(
                        context: context,
                        model: CreateAdsRequestModel(
                          userId: int.parse(
                            ref
                                .watch(storeUserIdProvider.notifier)
                                .getUserid()!,
                          ),
                          categories: [2, 5],
                          orderSummary: ' summaryController.text,',
                          itemQty: 5,
                          priority: 'medium',
                          userAddressId: 1,
                          preferredPickupTime: DateTime(3889),
                          images: [PickupImage(image: imageData!)],
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: Text(
                  lang.create,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colorpallets.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
