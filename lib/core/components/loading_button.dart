import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final String buttonName;
  final ButtonStyle? buttonStyle;
  final bool isLoading;
  final Function() onPressed;
  const LoadingButton(
    this.buttonName, {
    this.buttonStyle,
    required this.isLoading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle ?? ElevatedButton.styleFrom(),
      onPressed: isLoading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isLoading,
            child: const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
          const SizedBox(width: 3),
          Text(buttonName),
        ],
      ),
    );
  }
}
