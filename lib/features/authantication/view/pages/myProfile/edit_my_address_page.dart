import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_address_model.dart';
import 'package:aakrikada/features/authantication/view/pages/myProfile/add_address_page.dart';
import 'package:aakrikada/features/authantication/view/widgets/address_card_widget.dart';
import 'package:aakrikada/features/authantication/view/widgets/auth_common_btn_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EditMyAddressPage extends StatelessWidget {
  const EditMyAddressPage({super.key, required this.addressModel});

  final GetAddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
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
                      icon: Icon(Icons.arrow_back, color: Colorpallets.primary),
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
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colorpallets.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      addressModel!.data.isEmpty
                          ? Center(child: Text('No addess found'))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: addressModel!.data.length,
                              itemBuilder: (context, index) {
                                return AddressCardWidget(
                                  addressData: addressModel!.data[index],
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
                            builder: (context) => const AddAddressBottomSheet(),
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
      ),
    );
  }
}
