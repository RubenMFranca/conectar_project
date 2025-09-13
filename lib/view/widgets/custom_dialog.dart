import 'package:flutter/material.dart';

class CustomDialog {
  static void success({
    required BuildContext context,
    required String message,
    String buttonText = "OK",
    VoidCallback? onPressed,
  }) {
    _showDialog(
      context: context,
      message: message,
      buttonText: buttonText,
      icon: Icon(Icons.check_circle, color: Color(0xff10b981), size: 50),
      buttonColor: Color(0xffef4444),
      onPressed: onPressed,
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    String buttonText = "OK",
    VoidCallback? onPressed,
  }) {
    _showDialog(
      context: context,
      message: message,
      buttonText: buttonText,
      icon: const Icon(Icons.error, color: Color(0xffef4444), size: 50),
      buttonColor: Color(0xffef4444),
      onPressed: onPressed,
    );
  }

  static void _showDialog({
    required BuildContext context,
    required String message,
    required String buttonText,
    required Icon icon,
    required Color buttonColor,
    VoidCallback? onPressed,
  }) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
