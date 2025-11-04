import 'dart:developer';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/address_request_model.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_address_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_areas_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_districts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';

class AddNewAddressBottomSheet extends ConsumerStatefulWidget {
  const AddNewAddressBottomSheet({super.key});

  @override
  ConsumerState<AddNewAddressBottomSheet> createState() =>
      _AddNewAddressBottomSheetState();
}

class _AddNewAddressBottomSheetState
    extends ConsumerState<AddNewAddressBottomSheet> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController townController = TextEditingController();

  String? selectedDistrict;
  String? selectedArea;

  GetDistrictsModel? allDistricts;
  List<Area> allAreas = [];

  bool isLoadingDistricts = true;
  bool isLoadingAreas = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      try {
        final districts = await ref
            .read(apiAddressProvider.notifier)
            .getDistrict();
        setState(() {
          allDistricts = districts;
          isLoadingDistricts = false;
        });
      } catch (e) {
        showAppSnakBar("Failed to load districts", Colorpallets.redColor);
        setState(() => isLoadingDistricts = false);
      }
    });
  }

  @override
  void dispose() {
    addressController.dispose();
    townController.dispose();
    super.dispose();
  }

  Future<void> fetchAreas(String districtId) async {
    setState(() {
      isLoadingAreas = true;
      allAreas = [];
      selectedArea = null;
    });

    try {
      final result = await ref
          .read(apiAddressProvider.notifier)
          .getAreas(district: districtId);
      if (result != null) {
        setState(() {
          allAreas = result;
        });
      }
    } catch (e) {
      showAppSnakBar("Failed to load areas", Colorpallets.redColor);
    } finally {
      setState(() {
        isLoadingAreas = false;
      });
    }
  }

  Future<List<Location>?> getLongLat() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).padding.bottom + 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // House Name
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "House Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Town
            TextField(
              controller: townController,
              decoration: InputDecoration(
                labelText: lang.town,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // District dropdown
            isLoadingDistricts
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colorpallets.primary,
                    ),
                  )
                : DropdownButtonFormField<String>(
                    value: selectedDistrict,
                    decoration: InputDecoration(
                      labelText: lang.district,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items:
                        allDistricts?.data
                            .map(
                              (d) => DropdownMenuItem(
                                value: d.district,
                                child: Text(d.district),
                              ),
                            )
                            .toList() ??
                        [],
                    onChanged: (val) {
                      setState(() {
                        selectedDistrict = val;
                      });
                      if (val != null) {
                        log(val);
                        fetchAreas(val);
                      }
                    },
                  ),
            const SizedBox(height: 16),

            // Area dropdown
            isLoadingAreas
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colorpallets.primary,
                    ),
                  )
                : DropdownButtonFormField<String>(
                    value: selectedArea,
                    decoration: InputDecoration(
                      labelText: lang.area,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: allAreas
                        .map(
                          (a) => DropdownMenuItem(
                            value: a.id,
                            child: Text(a.area),
                          ),
                        )
                        .toList(),
                    onChanged: allAreas.isNotEmpty
                        ? (val) {
                            setState(() {
                              selectedArea = val;
                            });
                          }
                        : null,
                  ),
            const SizedBox(height: 24),

            // Save button
            AuthCommonButton(
              tittle: lang.saveAddress,
              onpressed: () async {
                if (selectedArea != null &&
                    selectedDistrict != null &&
                    townController.text.isNotEmpty &&
                    addressController.text.isNotEmpty) {
                  List<Location> locations = [];
                  try {
                    locations = await locationFromAddress(
                      "$selectedArea, $selectedDistrict",
                    );
                  } catch (e) {
                    showAppSnakBar(lang.errorAddress, Colorpallets.redColor);
                  }

                  await ref
                      .read(apiAddressProvider.notifier)
                      .createAnAddress(
                        model: AddAddressRequestModel(
                          userId: int.parse(
                            ref.read(storeUserIdProvider.notifier).getUserid()!,
                          ),
                          address: addressController.text,
                          area: selectedArea ?? 'vadakara',
                          town: townController.text,
                          district: selectedDistrict ?? 'calicut',
                          lat: locations[0].latitude.toString(),
                          lng: locations[0].longitude.toString(),
                        ),
                      );
                  ref.invalidate(getAddressProvider);
                  // await ref.read(apiAddressProvider.notifier).
                  Navigator.pop(context);
                } else {
                  showAppSnakBar(
                    lang.fillAlltheFields,
                    Colorpallets.blackColor,
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
