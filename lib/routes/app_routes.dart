import 'package:archlelabsadmin/bindings.dart/blog_bindings.dart';
import 'package:archlelabsadmin/bindings.dart/designation_bindings.dart';
import 'package:archlelabsadmin/bindings.dart/home_bindings.dart';
import 'package:archlelabsadmin/bindings.dart/intial_bindings.dart';
import 'package:archlelabsadmin/screens/blogs.dart/add_blogs.dart';
import 'package:archlelabsadmin/screens/blogs.dart/blogs.dart';
import 'package:archlelabsadmin/screens/dashboard/add_designation.dart';
import 'package:archlelabsadmin/screens/dashboard/designation.dart';
import 'package:archlelabsadmin/screens/team/add_team.dart';
import 'package:archlelabsadmin/screens/team/teams.dart';
import 'package:archlelabsadmin/splash.dart';
import 'package:get/get.dart';

import '../bindings.dart/team_bindings.dart';
import '../screens/auth/login.dart';
import '../screens/main/main_screen.dart';

class Routes {
  static String home = '/home';
  static String splash = '/';
  static String login = '/login';
  static String signup = '/signup';
  static String blog = '/blogs';
  static String addblog = '/addblogs';
  static String team = '/team';
  static String addTeam = '/addTeam';
  static String designation = '/designation';
  static String addDesignation = '/addDesignation';
}

appRoutes() => [
      GetPage(
          name: Routes.home, page: () => MainScreen(), binding: HomeBindings()),
      GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
      ),
      GetPage(name: Routes.blog, page: () => Blog(), binding: BlogBindings()),
      GetPage(
          name: Routes.addblog, page: () => AddBlog(), binding: BlogBindings()),
      GetPage(
          name: Routes.designation,
          page: () => DesignationPage(),
          binding: DesignationBindings()),
      GetPage(
          name: Routes.addDesignation,
          page: () => AddDesignation(),
          binding: DesignationBindings()),
      GetPage(name: Routes.team, page: () => Team(), binding: TeamBindings()),
      GetPage(
          name: Routes.addTeam, page: () => AddTeam(), binding: TeamBindings()),
      GetPage(
          name: Routes.designation,
          page: () => Team(),
          binding: TeamBindings()),
      GetPage(
          name: Routes.addDesignation,
          page: () => AddTeam(),
          binding: TeamBindings()),
      GetPage(name: Routes.login, page: () => Login()),
    ];
