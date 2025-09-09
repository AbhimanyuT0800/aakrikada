import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/controller/shared_pref_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showLanguageDialog({
  required BuildContext context,
  required String title,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LanguageOption(title: 'മലയാളം', code: 'ml'),
            LanguageOption(title: 'हिन्दी', code: 'hi'),
            LanguageOption(title: 'English', code: 'en'),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );
    },
  );
}

class LanguageOption extends ConsumerWidget {
  final String title;
  final String code;

  const LanguageOption({super.key, required this.title, required this.code});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colorpallets.primary),
        ),
        title: Text(title),
        onTap: () {
          ref.watch(appLanguageProvider.notifier).updatelang(code);
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    );
  }
}
