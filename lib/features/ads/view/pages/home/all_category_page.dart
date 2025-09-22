import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/controller/api_ads_provider.dart';
import 'package:aakrikada/features/ads/view/widgets/listed_item_widget.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCategoryPage extends ConsumerWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adsData = ref.watch(
      getuserAdsProvider(ref.read(storeUserIdProvider.notifier).getUserid()!),
    );

    return adsData.when(
      data: (data) {
        if (data == null || data.data.isEmpty) {
          return Center(child: Text('No data Found'));
        }

        return RefreshIndicator(
          color: Colorpallets.primary,
          onRefresh: () async {
            ref.invalidate(getuserAdsProvider);
            await Future.delayed(Duration(seconds: 1));
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: data.data.length,
            itemBuilder: (context, index) => ItemDetailsCard(
              adsData: data.data[index],
              isStatusNeeded: false,
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () =>
          Center(child: CircularProgressIndicator(color: Colorpallets.primary)),
    );
  }
}
