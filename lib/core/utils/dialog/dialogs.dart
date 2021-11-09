import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future showErrorDialog({
    required Widget content,
    bool isDismissable = true,
  }) async {
    return await Get.defaultDialog(
      title: 'error'.tr,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      content: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const Divider(
              color: Colors.white,
              height: 10,
              thickness: 1,
            ),
            content
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      titlePadding: const EdgeInsets.all(8.0),
      barrierDismissible: isDismissable,
    );
  }

  static Future showWarningDialog({
    required Widget content,
    bool isDismissable = true,
  }) async {
    return await Get.defaultDialog(
      title: 'warning'.tr,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      backgroundColor: Colors.orangeAccent,
      content: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const Divider(
              color: Colors.white,
              height: 10,
              thickness: 1,
            ),
            content
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      titlePadding: const EdgeInsets.all(8.0),
      barrierDismissible: isDismissable,
    );
  }

  static Future showDialog(
      {String title = "",
      required Widget content,
      Color backgroundColor = Colors.white}) async {
    return await Get.defaultDialog(
      title: title,
      content: content,
      backgroundColor: backgroundColor,
    );
  }
}
