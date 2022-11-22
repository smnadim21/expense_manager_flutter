import 'package:n_flutter/app/services/auth_service.dart';
import 'package:n_flutter/tools/ui/customui.dart';

import 'global_import.dart';

Future<void> main() async {
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
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: createMaterialColor(themeColor),
        primaryColor: LocalColors.text_red,
        primaryColorDark: LocalColors.text_red,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
    );
  }
}
