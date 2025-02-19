import 'package:archlelabsadmin/routes/app_routes.dart';
import 'package:archlelabsadmin/screens/blogs.dart/blogs.dart';
import 'package:archlelabsadmin/screens/dashboard/dashboard_screen.dart';
import 'package:archlelabsadmin/screens/dashboard/queries.dart';
import 'package:archlelabsadmin/screens/main/main_screen.dart';
import 'package:archlelabsadmin/screens/team/add_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/HomeController.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Get.toNamed(Routes.home);
            },
          ),
          // DrawerListTile(
          //   title: "Transaction",
          //   svgSrc: "assets/icons/menu_tran.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Task",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {},
          // ),
          DrawerListTile(
            title: "Blogs",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.offNamedUntil(
                Routes.blog,
                (route) => route.isFirst,
              );
            },
          ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          DrawerListTile(
            title: "Team",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Get.offNamedUntil(
                Routes.team,
                (route) => route.isFirst,
              );
            },
          ),
          DrawerListTile(
            title: "Designation",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.offNamedUntil(
                Routes.designation,
                (route) => route.isFirst,
              );
            },
          ),
          DrawerListTile(
            title: "Queries",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.put(HomeController());
              Get.offUntil(
                GetPageRoute(
                  page: () => QueriesPage(index: 0),
                ),
                (route) => route.isFirst,
              );
            },
          ),
          DrawerListTile(
            title: "Investors",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.put(HomeController());
              Get.offUntil(
                GetPageRoute(
                  page: () => QueriesPage(index: 2),
                ),
                (route) => route.isFirst,
              );
            },
          ),
          DrawerListTile(
            title: "Press Release",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.put(HomeController());
              Get.offUntil(
                GetPageRoute(
                  page: () => QueriesPage(index: 1),
                ),
                (route) => route.isFirst,
              );
            },
          ),

          DrawerListTile(
            title: "Job Apply",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.put(HomeController());
              Get.offUntil(
                GetPageRoute(
                  page: () => QueriesPage(index: 3),
                ),
                (route) => route.isFirst,
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 12,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
