import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/tools/shared_pref.dart';
import 'package:money_manager/tools/ui/customui.dart';

import 'app/services/auth_service.dart';
import 'global_import.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final sp = await OfflineData.getInstance();
    return sp;
  }, permanent: true);

  Get.put(AuthService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Money Manager",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: createMaterialColor(themeColor),
          primaryColor: LocalColors.text_red,
          primaryColorDark: LocalColors.text_red,
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().textTheme.copyWith(
                bodyLarge: ThemeData.light()
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LocalColors.text_color),
            ),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: LocalColors.appbar_bg,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColor.colorPrimary,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                systemNavigationBarColor: AppColor.colorPrimary,
              ),
              titleTextStyle: GoogleFonts.pacifico(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              toolbarTextStyle: GoogleFonts.pacifico(color: themeColor),
              iconTheme: const IconThemeData(color: LocalColors.text_muted))),
    );
  }
}
