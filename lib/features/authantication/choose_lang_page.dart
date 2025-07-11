import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/core/constatnts/asset_files.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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
              DropdownButtonFormField<String>(
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                value: selectedLanguage,

                items: languages.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              Spacer(),
              Image.asset(AssetFiles.ksmaLogo, width: 100),
              Text(
                'Powered by KSMA',
                style: TextStyle(color: Colorpallets.whiteColor),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colorpallets.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 14,
                    horizontal: 32,
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
            ],
          ),
        ),
      ),
    );
  }
}
