import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/controller/address_id_provider.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_address_provider.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_address_model.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/update_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressCardWidget extends ConsumerWidget {
  const AddressCardWidget({
    super.key,
    required this.addressData,
    this.isSelectAddress = false,
  });
  final AddressData addressData;
  final bool isSelectAddress;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: isSelectAddress
            ? null
            : () {
                ref.watch(addressIdProvider.notifier).state = int.parse(
                  addressData.id,
                );
                Navigator.pop(context);
              },
        child: Card(
          color: Colorpallets.whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressData.address),
                    Text(addressData.town),
                    Text(addressData.district),
                  ],
                ),
                Spacer(),

                // edit address
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (context) =>
                          UpdateAddressBottomSheet(model: addressData),
                    );
                  },
                  icon: Icon(
                    Icons.edit_location_alt_sharp,
                    color: Colorpallets.seconday,
                    size: 24,
                  ),
                ),

                // delete address
                IconButton(
                  onPressed: () async {
                    await ref
                        .read(apiAddressProvider.notifier)
                        .deleteAnAddress(
                          id: ref
                              .watch(storeUserIdProvider.notifier)
                              .getUserid()!,
                          addressId: addressData.id,
                        );
                    ref.invalidate(getAddressProvider);
                  },
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: Colorpallets.redColor,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
