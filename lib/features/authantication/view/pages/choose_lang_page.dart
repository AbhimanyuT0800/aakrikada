import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/constatnts/asset_files.dart';
import 'package:aakrikada/core/utils/show_app_snakbar.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:aakrikada/features/authantication/view/pages/phone_input_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseLangPage extends StatefulWidget {
  const ChooseLangPage({super.key});

  @override
  State<ChooseLangPage> createState() => _ChooseLangPageState();
}

class _ChooseLangPageState extends State<ChooseLangPage> {
  final List<String> languages = ['English', 'Hindi', 'Malayalam'];

  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    // language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colorpallets.primary, Colorpallets.seconday],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                AssetFiles.appLogo,
                filterQuality: FilterQuality.low,
                cacheHeight: 200,
              ),
              Text(
                lang.title,
                style: TextStyle(
                  color: Colorpallets.whiteColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                lang.slogan,
                style: TextStyle(color: Colorpallets.whiteColor, fontSize: 14),
              ),
              Spacer(),

              Consumer(
                builder: (context, ref, _) {
                  return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(8),
                    dropdownColor: Colorpallets.grey50Color,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colorpallets.blackColor,
                    ),
                    hint: Text(lang.selectLang),

                    decoration: InputDecoration(
                      labelText: lang.selectLang,
                      labelStyle: TextStyle(color: Colorpallets.blackColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colorpallets.whiteColor),
                      ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colorpallets.whiteColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(08),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    value: selectedLanguage,

                    items: [
                      DropdownMenuItem<String>(
                        value: 'en',
                        child: Text(languages[0]),
                      ),
                      DropdownMenuItem<String>(
                        value: 'hi',
                        child: Text(languages[1]),
                      ),
                      DropdownMenuItem<String>(
                        value: 'ml',
                        child: Text(languages[2]),
                      ),
                    ],
                    onChanged: (value) async {
                      // slected language changes when selected
                      setState(() {
                        selectedLanguage = value;
                      });

                      // then change shared pref by selected lang
                      ref
                          .watch(appLanguageProvider.notifier)
                          .updatelang(value ?? 'en');
                    },
                  );
                },
              ),
              Spacer(),
              Image.asset(AssetFiles.ksmaLogo, width: 100),
              Text(
                'Powered by KSMA',
                style: TextStyle(color: Colorpallets.whiteColor),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // if no language selected show alert snakbar
                  if (selectedLanguage == null) {
                    showAppSnakBar(
                      'Select language to continue',
                      Colorpallets.blackColor,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneInputPage()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorpallets.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 12,
                      horizontal: 42,
                    ),
                    child: Text(
                      lang.getStarted,
                      style: TextStyle(
                        color: Colorpallets.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
