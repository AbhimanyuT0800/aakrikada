import 'package:aakrikada/api_key/api_key.dart';
import 'package:aakrikada/core/constatnts/app_urls.dart';
import 'package:aakrikada/core/utils/api_exceptions.dart';
import 'package:aakrikada/features/authantication/domain/model/otp_verified_model.dart';
import 'package:aakrikada/features/authantication/domain/model/verified_user_model.dart';
import 'package:dio/dio.dart';

class ApiAuthServices {
  // instance for DIO
  final _dio = Dio(BaseOptions(baseUrl: AppUrls.baseUrl));

  // verify user mobile number
  Future<VerifiedUserModel?> verifyUser({required String phn}) async {
    try {
      Response response = await _dio.post(
        AppUrls.verifyUser,
        data: {"phone": phn, "role": 1},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "X-lang": "en",
            "Accept": "application/json",
            "X-API-KEY": ApiKey.apiKeyValue,
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return VerifiedUserModel.fromJson(response.data);
      } else {
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  // OTP verifiaction logic
  Future<OtpVerifyModel?> verifyOtpService(String phn, String otp) async {
    try {
      Response response = await _dio.post(
        AppUrls.verifyOtp,
        data: {"phone": phn, "otp": otp, "role": 1},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "X-lang": "en",
            "Accept": "application/json",
            "X-API-KEY": ApiKey.apiKeyValue,
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        return OtpVerifyModel.fromJson(response.data);
      } else {
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // OTP resent logic
  Future<VerifiedUserModel?> resendOtpService(String phn) async {
    try {
      Response response = await _dio.post(
        AppUrls.resendOtp,
        data: {"phone": phn, "role": 1},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "X-lang": "en",
            "Accept": "application/json",
            "X-API-KEY": ApiKey.apiKeyValue,
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        return VerifiedUserModel.fromJson(response.data);
      } else {
        throw Exception("Unexpected server response");
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception(" ${e.toString()}");
    }
  }
}
