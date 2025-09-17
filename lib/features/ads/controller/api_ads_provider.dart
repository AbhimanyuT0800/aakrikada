import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/domain/create_ads_request_model.dart';
import 'package:aakrikada/features/ads/domain/model/get_user_ads_model.dart';
import 'package:aakrikada/features/ads/services/api_ads_services.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_ads_provider.g.dart';

@riverpod
class ApiAds extends _$ApiAds {
  @override
  bool build() {
    return false;
  }

  Future<void> createAds({
    required BuildContext context,
    required CreateAdsRequestModel model,
  }) async {
    try {
      state = true;
      await ApiAdsServices().createAds(model: model);
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(e.toString(), Colorpallets.redColor);
    } finally {
      state = false;
    }
  }
}

// Getting all user ads
@riverpod
Future<GetUserAdsModel?> getuserAds(ref, String id) async {
  try {
    final data = await ApiAdsServices().getUserAdsService(id: int.parse(id));
    return data;
  } catch (e) {
    // catch all error throw from api service
    showAppSnakBar(
      e.toString().replaceFirst("Exception: ", ""),
      Colorpallets.redColor,
    );
  } finally {}
  return null;
}
