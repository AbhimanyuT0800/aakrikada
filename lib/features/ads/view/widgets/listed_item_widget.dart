import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/domain/model/get_user_ads_model.dart';
import 'package:aakrikada/features/ads/view/pages/order_details_page.dart';
import 'package:flutter/material.dart';

// class ListedItemWidget extends StatelessWidget {
//   const ListedItemWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) => ItemDetailsCard(),
//     );
//   }
// }

class ItemDetailsCard extends StatelessWidget {
  const ItemDetailsCard({super.key, required this.adsData});
  final AdData adsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsPage(adsData: adsData),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colorpallets.grey50Color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(width: 88, child: Image.network(adsData.image)),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  adsData.categories,
                  style: TextStyle(fontSize: 16, color: Colorpallets.greyColor),
                ),
                Text(
                  adsData.orderSummary,
                  style: TextStyle(
                    color: Colorpallets.greenColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '11 july 2002,11:00 am',
                  style: TextStyle(fontSize: 16, color: Colorpallets.greyColor),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    adsData.status,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colorpallets.greenColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
