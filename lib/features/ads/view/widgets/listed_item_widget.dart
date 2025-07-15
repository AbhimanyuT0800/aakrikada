import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:flutter/material.dart';

class ListedItemWidget extends StatelessWidget {
  const ListedItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colorpallets.grey50Color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 102,
              child: Image.asset('assets/images/img_avathar.jpg'),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Chair',
                  style: TextStyle(fontSize: 16, color: Colorpallets.greyColor),
                ),
                Text(
                  'Plastic',
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colorpallets.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
