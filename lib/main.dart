import 'package:aakrikada/features/authantication/controller/language_provider.dart';
import 'package:aakrikada/features/authantication/services/lang_shared_pref_service.dart';
import 'package:aakrikada/features/authantication/view/pages/choose_lang_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize shared pref
  await LangSharedPrefService.initializePref();

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // get selected language from shared pref
      locale: Locale(ref.watch(appLanguageProvider)),
      supportedLocales: [Locale('en'), Locale('hi'), Locale('ml')],
      scaffoldMessengerKey: scaffoldMessngerKey,
      home: ChooseLangPage(),
    );
  }
}
