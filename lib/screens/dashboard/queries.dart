
import 'package:archlelabsadmin/screens/dashboard/components/jobapply_table.dart';
import 'package:archlelabsadmin/screens/main/components/site_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/HomeController.dart';
import 'components/investors_table.dart';
import 'components/press_release.dart';
import 'components/query_table.dart';

class QueriesPage extends StatelessWidget {
  QueriesPage({super.key, required this.index});
  final int index;
  final homeController = Get.find<HomeController>();

  check(context) {
    switch (index) {
      case 0:
        homeController.getAllQueries();
        return buildQuery(context);
        break;
      case 1:
        homeController.getAllPressRelase();
        return buildPressRelease(context);
        break;
      case 2:
        homeController.getAllInvestors();
        return buildInvestors(context);
        break;
      default:
        homeController.getJobApplyLiast();
        return buildJobApply(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: check(context),
    );
  }
}
