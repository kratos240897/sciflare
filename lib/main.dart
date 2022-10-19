import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loggy/loggy.dart';
import 'package:sciflare/data/models/user_model.dart';
import 'package:sciflare/helpers/constants.dart';
import 'package:sciflare/repo/app_repo.dart';
import 'package:sciflare/routes/router.dart';
import 'package:sciflare/routes/routes.dart';
import 'package:sciflare/service/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDB();
  await inject();
  Loggy.initLoggy(
    logPrinter: const PrettyDeveloperPrinter(),
  );
  runApp(const MyApp());
}

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<UserModel>(Constants.DB_NAME);
}

Future<void> inject() async {
  Get.lazyPut(() => ApiService(), fenix: true);
  Get.lazyPut(() => AppRepo(), fenix: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sciflare Task',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily),
      initialRoute: Routes.HOME,
      onGenerateRoute: PageRouter.onGenerateRoute,
    );
  }
}
