import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.icBgColor,
    required this.icon,
    required this.title,
    this.isLogout = false,
  });

  final Color icBgColor;
  final Icon icon;
  final String title;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Card(
        color: Colorpallets.whiteColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: icBgColor,
                ),
                child: icon,
              ),
              SizedBox(width: 18),
              Text(title, style: TextStyle(fontSize: 16)),
              Spacer(),
              isLogout ? SizedBox() : Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
