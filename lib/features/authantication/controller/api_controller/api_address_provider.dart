import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/address_request_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_address_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_areas_model.dart';
import 'package:aakrikada/features/authantication/domain/model/address_models/get_districts_model.dart';
import 'package:aakrikada/features/authantication/services/api_address_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_address_provider.g.dart';

@riverpod
class ApiAddress extends _$ApiAddress {
  @override
  bool build() {
    return false;
  }

  // Getting all user address
  Future<GetAddressModel?> getAddress(String id) async {
    state = true;
    try {
      final data = await ApiAddressServices().getUserAddress(int.parse(id));
      return data;
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
    return null;
  }

  // delete an address
  Future<void> deleteAnAddress({
    required String id,
    required String addressId,
  }) async {
    state = true;
    try {
      await ApiAddressServices().deleteAnAddress(
        id: int.parse(id),
        addressId: addressId,
      );
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      // await getAddress(id);
      state = false;
    }
  }

  // create an address
  Future<void> createAnAddress({required AddAddressRequestModel model}) async {
    state = true;
    try {
      await ApiAddressServices().addNewAddress(model);
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
  }

  // update an address
  Future<void> updateAnAddress({required UpdateAddressModel model}) async {
    state = true;
    try {
      await ApiAddressServices().updateAddress(model);
    } catch (e) {
      // catch all error throw from api service
      // showAppSnakBar(
      //   e.toString().replaceFirst("Exception: ", ""),
      //   Colorpallets.redColor,
      // );
    } finally {
      state = false;
    }
  }

  // getting all districts
  Future<GetDistrictsModel?> getDistrict() async {
    state = true;
    try {
      final data = await ApiAddressServices().getAllDistricts();
      return data;
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
    return null;
  }

  // getting all districts
  Future<List<Area>?> getAreas({required String district}) async {
    state = true;
    try {
      final data = await ApiAddressServices().getAllAreas(district);
      return data;
    } catch (e) {
      // catch all error throw from api service
      showAppSnakBar(
        e.toString().replaceFirst("Exception: ", ""),
        Colorpallets.redColor,
      );
    } finally {
      state = false;
    }
    return null;
  }
}

// Getting all user address
@riverpod
Future<GetAddressModel?> getAddress(ref, String id) async {
  try {
    final data = await ApiAddressServices().getUserAddress(int.parse(id));
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
