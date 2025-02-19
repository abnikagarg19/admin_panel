import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/responsive.dart';
import 'package:archlelabsadmin/screens/dashboard/dashboard_screen.dart';
import 'package:archlelabsadmin/screens/main/components/site_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blogs.dart/blogs.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: DashboardScreen(),
    );
  }
}
