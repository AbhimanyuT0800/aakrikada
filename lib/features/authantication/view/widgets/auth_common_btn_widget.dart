import 'package:flutter/material.dart';

class AuthCommonButton extends StatelessWidget {
  const AuthCommonButton({
    super.key,

    required this.tittle,
    required this.onpressed,
  });

  final String tittle;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 4,
          ),
          child: Text(
            tittle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
