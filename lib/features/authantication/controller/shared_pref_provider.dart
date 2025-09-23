import 'package:aakrikada/features/authantication/services/shared_pref_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_pref_provider.g.dart';

@riverpod
class AppLanguage extends _$AppLanguage {
  @override
  String build() {
    return SharedPrefService.getPrefLang();
  }

  Future<void> updatelang(String lang) async {
    await SharedPrefService.updateLang(lang);
    state = lang;
  }

  String getPrefLang() {
    return SharedPrefService.getPrefLang();
  }
}

@riverpod
class StoreUserId extends _$StoreUserId {
  @override
  String? build() {
    return SharedPrefService.getUserId();
  }

  String? getUserid() {
    return SharedPrefService.getUserId();
  }

  Future<void> addUserId(String id) async {
    await SharedPrefService.addUserId(id);
    state = id;
  }

  Future<void> addUserDetails({required UserDetails details}) async {
    await SharedPrefService.updateUserDetails(details);
  }

  UserDetails getUserDeatils() {
    return SharedPrefService.getUserDetails();
  }
}

class UserDetails {
  final String name;
  final String email;
  final String img;
  UserDetails({required this.name, required this.img, required this.email});
}
