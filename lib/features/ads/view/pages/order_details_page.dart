import 'package:aakrikada/features/ads/domain/model/get_user_ads_model.dart';
import 'package:aakrikada/features/ads/view/widgets/quotes_card_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/view/widgets/listed_item_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.adsData});

  final AdData adsData;
  @override
  Widget build(BuildContext context) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colorpallets.whiteColor,
      body: Stack(
        children: [
          // Top Gradient Background
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          // Scrollable Body Content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colorpallets.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          lang.orderDetails,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colorpallets.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //  item card sctn
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ItemDetailsCard(adsData: adsData),
                  ),

                  const SizedBox(height: 16),

                  // Bottom white sctn
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colorpallets.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang.quotes,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Quote Card
                        QuoteCardWidget(isSelected: true),
                        QuoteCardWidget(isSelected: false),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
