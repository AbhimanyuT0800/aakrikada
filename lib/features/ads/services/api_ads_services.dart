import 'dart:developer';

import 'package:aakrikada/api_key/api_key.dart';
import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/constatnts/app_urls.dart';
import 'package:aakrikada/core/utils/api_exceptions.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/ads/domain/create_ads_request_model.dart';
import 'package:aakrikada/features/ads/domain/model/categories_model.dart';
import 'package:aakrikada/features/ads/domain/model/get_user_ads_model.dart';
import 'package:dio/dio.dart';

class ApiAdsServices {
  // instance for DIO
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "X-lang": "en",
        "Accept": "application/json",
        "X-API-KEY": ApiKey.apiKeyValue,
      },
    ),
  );

  // geting categories for the ads

  Future<CategoryResponse> getAdCategories() async {
    try {
      Response response = await _dio.get(AppUrls.getCategories);
      if (response.statusCode == 200) {
        return CategoryResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  // create ads section
  Future<void> createAds({required CreateAdsRequestModel model}) async {
    try {
      Response response = await _dio.post(
        AppUrls.createAds,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        showAppSnakBar("Ad successfuly added", Colorpallets.greenColor);
        log(response.data.toString());
      } else {
        log(response.statusCode.toString());
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(handleDioError(e));
    } catch (e) {
      log(e.toString());
      throw Exception("Error: ${e.toString()}");
    }
  }

  // get user ads section
  Future<GetUserAdsModel?> getUserAdsService({required int id}) async {
    try {
      Response response = await _dio.post(
        AppUrls.getAds,
        data: {"user_id": id, "limit": 10},
      );

      if (response.statusCode == 200) {
        final data = GetUserAdsModel.fromJson(response.data);
        return data;
      } else {
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(handleDioError(e));
    } catch (e) {
      log(e.toString());
      throw Exception("Error: ${e.toString()}");
    }
  }
}
