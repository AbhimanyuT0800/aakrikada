import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/controller/address_id_provider.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_address_provider.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/view/widgets/add_new_address_page.dart';
import 'package:aakrikada/features/authantication/view/widgets/address_card_widget.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditMyAddressPage extends ConsumerWidget {
  const EditMyAddressPage({super.key, this.isSelectAddress = false});
  final bool? isSelectAddress;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    final userAddressData = ref.watch(
      getAddressProvider(ref.read(storeUserIdProvider.notifier).getUserid()!),
    );
    return Scaffold(
      body: userAddressData.when(
        data: (data) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colorpallets.primary,
                          ),
                        ),
                        Text(
                          lang.myAdress,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colorpallets.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //White Container
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colorpallets.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          data!.data.isEmpty
                              ? Center(child: Text('No address found'))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.data.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: isSelectAddress ?? false
                                          ? () {
                                              ref
                                                  .watch(
                                                    addressIdProvider.notifier,
                                                  )
                                                  .state = int.parse(
                                                data.data[index].id,
                                              );
                                              Navigator.pop(context);
                                            }
                                          : null,
                                      child: AddressCardWidget(
                                        isSelectAddress:
                                            isSelectAddress ?? false,
                                        addressData: data.data[index],
                                      ),
                                    );
                                  },
                                ),

                          Spacer(),
                          AuthCommonButton(
                            tittle: 'Add',
                            onpressed: () {
                              //add new address
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                builder: (context) =>
                                    const AddNewAddressBottomSheet(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) =>
            Center(child: Text('Pleace try again...')),
        loading: () => Center(
          child: CircularProgressIndicator(color: Colorpallets.primary),
        ),
      ),
    );
  }
}
