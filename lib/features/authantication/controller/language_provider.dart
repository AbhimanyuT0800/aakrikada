import 'package:aakrikada/features/authantication/services/lang_shared_pref_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@riverpod
class AppLanguage extends _$AppLanguage {
  @override
  String build() {
    return LangSharedPrefService.getPrefLang();
  }

  Future<void> updatelang(String lang) async {
    await LangSharedPrefService.updateLang(lang);
    state = lang;
  }

  String getPrefLang() {
    return LangSharedPrefService.getPrefLang();
  }
}
