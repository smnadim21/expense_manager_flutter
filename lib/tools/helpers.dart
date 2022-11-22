import 'dart:convert';

import '../global_import.dart';

void printJson(String str) {
  try {
    if (str != "") {
      final object = json.decode(str);
      final prettyString = const JsonEncoder.withIndent('  ').convert(object);
      print(prettyString);
    }
  } on Exception catch (e, stack) {
    ExceptionHandler.handle(e, stack);
    print(str);
    print(stack);
  }
}

String asPrettyJson(String incoming) {
  var prettyString = "";
  try {
    if (incoming != "") {
      prettyString = const JsonEncoder.withIndent('  ').convert(json.decode(incoming));
      return prettyString;
    }
  } on Exception catch (e, stack) {
    return incoming;
  }
  return prettyString;
}

class Snack {
  static void oK(String content, {String title = "Success", Widget? icon}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, content,
        icon: icon, snackPosition: SnackPosition.BOTTOM, colorText: Colors.white, backgroundColor: TEXT_ABC_DRIVER);
  }

  static void warn(String content, {String title = "Warn!", Widget? icon}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, content,
        snackPosition: SnackPosition.BOTTOM, colorText: Colors.black, backgroundColor: Colors.amber.shade300);
  }

  static void error(String content,
      {String title = "Error!",
      bool verbose = false,
      Widget? icon,
      int? code = -1,
      String? data = "",
      String? route = "--",
      String? request = "{}"}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, content,
        icon: icon,
        snackPosition: SnackPosition.BOTTOM,
        colorText: LocalColors.text_red,
        duration: const Duration(seconds: 300),
        isDismissible: true,
        mainButton: TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(LocalColors.text_red)),
            onPressed: () {
              if (verbose) {
                Get.back();
                Get.toNamed(Routes.debug_screen,
                    arguments: {"title": title, "code": code, "route": route, "data": data, "request": request});
              } else {
                Get.back();
              }
            },
            child: Text(
              (verbose ? "DETAILS" : "CLOSE"),
              style: const TextStyle(color: LocalColors.text_red_light),
            )),
        backgroundColor: LocalColors.text_red_light);
  }

  static void debug(String title, String content,
      {bool verbose = false, int? code = -1, String? data = "", String? route = "--", String? request = "{}"}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, content,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        duration: const Duration(seconds: 300),
        isDismissible: true,
        mainButton: TextButton(
            style: const ButtonStyle(
                //backgroundColor: MaterialStateProperty.all(LocalColors.text_blue),
                ),
            onPressed: () {
              if (verbose) {
                Get.back();
                Get.toNamed(Routes.debug_screen,
                    arguments: {"title": title, "code": code, "route": route, "data": data, "request": request});
              } else {
                Get.back();
              }
            },
            child: Text(
              (verbose ? "DETAILS" : "CLOSE"),
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        backgroundColor: LocalColors.text_blue_light);
  }
}

class ExceptionHandler {
  static void handle(Exception e, StackTrace trace) {
    Snack.error(e.toString(), title: "", verbose: true, data: trace.toString());
  }
}
