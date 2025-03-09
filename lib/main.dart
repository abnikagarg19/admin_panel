import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/routes/app_routes.dart';
import 'package:archlelabsadmin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'bindings.dart/intial_bindings.dart';
import 'constants.dart';
import 'screens/auth/login.dart';
import 'screens/dashboard/components/record.dart';
import 'theme/app_theme.dart';

void main() async {
  //calling DependencyInjection init method
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  DependencyInjection.init();
  await Future.delayed(const Duration(milliseconds: 400));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Admin Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),

       getPages:appRoutes(),
       initialRoute: Routes.splash,
       unknownRoute: GetPage(name: "/page_not_found", page:()=> Scaffold(body: Center(child: Text("Page not found"),),)),
       );
  }
}
