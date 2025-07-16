import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class QuoteCardWidget extends StatelessWidget {
  const QuoteCardWidget({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    //Language provider
    final lang = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD6F3E8), Color(0xFFE8F7F1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage('assets/images/img_avathar.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aneesh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "2022-03-12 10:00:23",
                  style: TextStyle(color: Colorpallets.greyColor),
                ),
                SizedBox(height: 4),
                Text("Electronics: ₹10/KG", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colorpallets.greenColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isSelected ? lang.selected : lang.accept,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
