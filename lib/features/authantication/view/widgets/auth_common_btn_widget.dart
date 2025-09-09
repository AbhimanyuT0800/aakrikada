import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/authantication/controller/api_controller/api_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCommonButton extends ConsumerWidget {
  const AuthCommonButton({
    super.key,

    required this.tittle,
    required this.onpressed,
  });

  final String tittle;
  final Function() onpressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: ref.watch(apiAuthProvider)
              ? CircularProgressIndicator(
                  color: Colorpallets.whiteColor,
                  strokeWidth: 4,
                  constraints: BoxConstraints(
                    maxWidth: 23,
                    maxHeight: 23,
                    minHeight: 23,
                    minWidth: 23,
                  ),
                )
              : Text(
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
