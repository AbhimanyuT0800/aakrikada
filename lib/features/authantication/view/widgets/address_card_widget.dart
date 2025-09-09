import 'dart:developer';

import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_address_provider.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressCardWidget extends ConsumerWidget {
  const AddressCardWidget({super.key, required this.addressData});
  final AddressData addressData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
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
                  Text(addressData.area),
                  Text(addressData.district),
                ],
              ),
              Spacer(),
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
                  ref.invalidate(apiAddressProvider);
                  log(' de');
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
    );
  }
}
