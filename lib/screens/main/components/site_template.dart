import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/responsive.dart';
import 'package:archlelabsadmin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../dashboard/components/header.dart';
import 'side_menu.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//key: Get.find<MenuAppController>().scaffoldKey,
      endDrawer: SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          if (Responsive.isDesktop(context))
            Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
          Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Header(),
                ),
                SizedBox(height: defaultPadding),
                body ?? SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
