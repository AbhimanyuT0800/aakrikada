class AppUrls {
  static const baseUrl = 'https://aakrikada.in/manage-app/rest/api';
  static const verifyUser = '/auth/verify';
  static const verifyOtp = '/auth/verify_otp';
  static const resendOtp = '/auth/resend_otp';

  // ads
  static const getCategories = '/user/get_categories';
  static const createAds = '/user/create_ad';
  static const getAds = '/user/get_ads';
  static const adDetails = '/user/ad_details';
  static const deleteAds = '/user/delete_ad';

  // address
  static const getUserAdress = '/user/get_address';
  static const addNewAdress = '/user/add_address';
  static const editAdress = '/user/edit_address';
  static const deleteAdress = '/user/delete_address';
  static const getAreas = '/auth/area?district=';
  static const getDistricts = '/auth/district';
}
