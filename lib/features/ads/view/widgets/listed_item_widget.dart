import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:flutter/material.dart';

class ListedItemWidget extends StatelessWidget {
  const ListedItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ItemDetailsCard(),
    );
  }
}

class ItemDetailsCard extends StatelessWidget {
  const ItemDetailsCard({super.key, this.isAccepted});

  final bool? isAccepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colorpallets.grey50Color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Image.asset('assets/images/img_demo.jpeg'),
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
          isAccepted != null
              ? Column(
                  children: [
                    Text(
                      isAccepted! ? 'Accepted' : 'Created',
                      style: TextStyle(fontWeight: FontWeight.w700),
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
                )
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colorpallets.greenColor,
                  ),
                ),
        ],
      ),
    );
  }
}
