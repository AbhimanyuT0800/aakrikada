import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/domain/model/categories_model.dart';
import 'package:aakrikada/features/ads/services/api_ads_services.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_categories_provider.g.dart';

@riverpod
Future<List<Category>?> getAppCategories(
  ref, {
  required BuildContext context,
}) async {
  try {
    final respo = await ApiAdsServices().getAdCategories();

    final data = respo.data;
    return data;
  } catch (e) {
    // catch all error throw from api service
    showAppSnakBar(
      e.toString().replaceFirst("Exception: ", ""),
      Colorpallets.redColor,
    );
  }

  return null;
}
