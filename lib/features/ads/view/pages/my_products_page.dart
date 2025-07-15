import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/view/widgets/listed_item_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  AppLocalizations.of(context)!.myOders,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colorpallets.primary,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorpallets.grey50Color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    children: [
                      ItemDetailsCard(isAccepted: true),
                      ItemDetailsCard(isAccepted: true),
                      ItemDetailsCard(isAccepted: false),
                    ],
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
