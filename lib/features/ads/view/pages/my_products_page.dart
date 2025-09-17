import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/controller/api_ads_provider.dart';
import 'package:aakrikada/features/ads/view/widgets/listed_item_widget.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProductsPage extends ConsumerWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adsData = ref.watch(
      getuserAdsProvider(ref.read(storeUserIdProvider.notifier).getUserid()!),
    );
    return Scaffold(
      backgroundColor: Colorpallets.whiteColor,
      body: adsData.when(
        data: (data) {
          return Container(
            width: double.infinity,
            height: double.infinity,
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Text(
                      AppLocalizations.of(context)!.myOders,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colorpallets.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colorpallets.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: data != null
                          ? ListView.builder(
                              itemCount: data.data.length,
                              itemBuilder: (context, index) =>
                                  ItemDetailsCard(adsData: data.data[index]),
                            )
                          : Center(child: Text('No data Found')),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(
          child: CircularProgressIndicator(color: Colorpallets.primary),
        ),
      ),
    );
  }
}
