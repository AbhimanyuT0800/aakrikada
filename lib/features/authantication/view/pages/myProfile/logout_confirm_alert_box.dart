import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void showLogoutConfirmationDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  // Language provider
  final lang = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          lang.confirm,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          lang.confirmLogout,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        actionsPadding: const EdgeInsets.only(right: 12, bottom: 10),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              lang.no,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm(); // handle logout here
            },
            child: Text(
              lang.yes,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
