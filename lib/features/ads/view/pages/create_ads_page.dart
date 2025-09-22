import 'dart:typed_data';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/controller/address_id_provider.dart';
import 'package:aakrikada/features/ads/controller/api_ads_provider.dart';
import 'package:aakrikada/features/ads/domain/create_ads_request_model.dart';
import 'package:aakrikada/features/ads/services/pick_image_services.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/edit_my_address_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAdPage extends ConsumerStatefulWidget {
  const CreateAdPage({super.key});

  @override
  ConsumerState<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends ConsumerState<CreateAdPage> {
  Uint8List? imageData;
  int? categoryCount;
  String? priority;
  DateTime? preferredPickupTime;

  final TextEditingController summaryController = TextEditingController();
  final TextEditingController itemCountController = TextEditingController();

  @override
  void dispose() {
    summaryController.dispose();
    itemCountController.dispose();
    super.dispose();
  }

  Future<void> _pickPreferredPickupTime(BuildContext context) async {
    final now = DateTime.now();

    // First pick date
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );

    if (pickedDate == null) return;

    // Then pick time
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );

    if (pickedTime == null) return;

    final combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() => preferredPickupTime = combined);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

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
        backgroundColor: const Color(0xFFDFFFEF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            Center(
              child: InkWell(
                onTap: () async {
                  final data = await PickImageServices().pickFromGallery();
                  if (data != null) {
                    setState(() => imageData = data);
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
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: imageData != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(imageData!, fit: BoxFit.cover),
                        )
                      : const Icon(Icons.camera_alt_outlined, size: 30),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(lang.selectCategory),
            const SizedBox(height: 4),

            // Category dropdown
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
                setState(() => categoryCount = int.tryParse(value ?? '1'));
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),

            // Summary
            Text(lang.summary),
            const SizedBox(height: 4),
            TextField(
              controller: summaryController,
              decoration: InputDecoration(
                hintText: lang.briefSummary,
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // Number of Items
            Text(lang.approxNbr),
            const SizedBox(height: 4),
            TextField(
              controller: itemCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),

            // Priority
            Text(lang.priority),
            const SizedBox(height: 4),
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
                setState(() => priority = value);
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),

            // User Information
            Text(
              lang.userInfo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tileColor: Colors.green[50],
              leading: CircleAvatar(
                backgroundColor: Colorpallets.greenColor,
                child: Icon(Icons.map, color: Colorpallets.whiteColor),
              ),
              title: Text(lang.chooseAdress),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EditMyAddressPage(isSelectAddress: true),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),

            // Preferred Pickup Time
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tileColor: Colors.orange[50],
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.access_time, color: Colors.white),
              ),
              title: Text(
                preferredPickupTime == null
                    ? lang.preferrrdPickup
                    : "${preferredPickupTime!.day}/${preferredPickupTime!.month}/${preferredPickupTime!.year} "
                          "${preferredPickupTime!.hour.toString().padLeft(2, '0')}:"
                          "${preferredPickupTime!.minute.toString().padLeft(2, '0')}",
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _pickPreferredPickupTime(context),
            ),
            const SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  final userId = ref
                      .read(storeUserIdProvider.notifier)
                      .getUserid();
                  final addressId = ref.read(addressIdProvider);

                  if (userId == null) {
                    showAppSnakBar(
                      "Missing user or address info",
                      Colorpallets.redColor,
                    );
                    return;
                  }

                  if (imageData != null &&
                      categoryCount != null &&
                      priority != null &&
                      preferredPickupTime != null &&
                      itemCountController.text.isNotEmpty &&
                      summaryController.text.isNotEmpty) {
                    final model = CreateAdsRequestModel(
                      userId: int.parse(userId),
                      categories: [categoryCount!],
                      orderSummary: summaryController.text,
                      itemQty: int.tryParse(itemCountController.text) ?? 1,
                      priority: priority!,
                      userAddressId: addressId,
                      preferredPickupTime: preferredPickupTime!,
                      images: [PickupImage(image: imageData!)],
                    );

                    ref
                        .read(apiAdsProvider.notifier)
                        .createAds(context: context, model: model);

                    ref.invalidate(apiAdsProvider);
                  } else {
                    showAppSnakBar(
                      "Please fill all fields",
                      Colorpallets.redColor,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                child: ref.watch(apiAdsProvider)
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colorpallets.whiteColor,
                        ),
                      )
                    : Text(
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
