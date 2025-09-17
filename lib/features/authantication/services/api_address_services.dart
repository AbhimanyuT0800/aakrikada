import 'dart:developer';

import 'package:aakrikada/api_key/api_key.dart';
import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/constatnts/app_urls.dart';
import 'package:aakrikada/core/utils/api_exceptions.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/address_request_model.dart';
import 'package:aakrikada/features/authantication/domain/model/api_success_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_address_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_areas_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_districts_model.dart';
import 'package:dio/dio.dart';

class ApiAddressServices {
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

  // getting user whole address details
  Future<GetAddressModel?> getUserAddress(int id) async {
    try {
      final Response response = await _dio.post(
        AppUrls.getUserAdress,
        data: {"user_id": id},
      );
      if (response.statusCode == 200) {
        final addressDetails = GetAddressModel.fromJson(response.data);
        return addressDetails;
      } else {
        showAppSnakBar('Something went wrong try again', Colorpallets.redColor);
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
    return null;
  }

  // Delete an address
  Future<void> deleteAnAddress({
    required int id,
    required String addressId,
  }) async {
    try {
      final Response response = await _dio.post(
        AppUrls.deleteAdress,
        data: {"user_id": id, "address_id": addressId},
      );
      if (response.statusCode == 200) {
        final data = SuccessModel.fromJson(response.data);
        showAppSnakBar(data.message, Colorpallets.greenColor);
      } else {
        showAppSnakBar('Something went wrong', Colorpallets.redColor);
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  // Add a new address

  Future<void> addNewAddress(AddAddressRequestModel model) async {
    log(model.toJson().toString());
    try {
      final Response response = await _dio.post(
        AppUrls.addNewAdress,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        final data = SuccessModel.fromJson(response.data);
        showAppSnakBar(data.message, Colorpallets.greenColor);
      } else {
        showAppSnakBar('Something went wrong', Colorpallets.redColor);
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  // Edit address
  Future<void> updateAddress(UpdateAddressModel model) async {
    log(model.toJson().toString());
    try {
      final Response response = await _dio.post(
        AppUrls.editAdress,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        final data = SuccessModel.fromJson(response.data);
        showAppSnakBar(data.message, Colorpallets.greenColor);
      } else {
        showAppSnakBar('Something went wrong', Colorpallets.redColor);
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  // get all districts
  Future<GetDistrictsModel?> getAllDistricts() async {
    try {
      final Response respo = await _dio.get(AppUrls.getDistricts);

      if (respo.statusCode == 200) {
        final data = GetDistrictsModel.fromJson(respo.data);
        return data;
      } else {
        showAppSnakBar(
          'Somthing went wrong...Try again',
          Colorpallets.blackColor,
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
    return null;
  }

  // get all areas from the district
  Future<List<Area>?> getAllAreas(String district) async {
    try {
      log(AppUrls.getAreas + district);
      final Response respo = await _dio.get(AppUrls.getAreas + district);

      if (respo.statusCode == 200) {
        final data = GetAreasModel.fromJson(respo.data);
        return data.data;
      } else {
        showAppSnakBar(
          'Somthing went wrong...Try again',
          Colorpallets.blackColor,
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
    return null;
  }
}
