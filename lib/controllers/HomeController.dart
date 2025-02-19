import 'dart:convert';

import 'package:archlelabsadmin/models/InvestorsModel.dart';
import 'package:archlelabsadmin/models/JobApplyModel.dart';
import 'package:archlelabsadmin/models/PressReleaseModel.dart';
import 'package:archlelabsadmin/models/QueriesModel.dart';
import 'package:archlelabsadmin/services/auth_repo.dart';
import 'package:archlelabsadmin/services/home_repo.dart';
import 'package:archlelabsadmin/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref.dart';

class HomeController extends GetxController {
  bool isLoadedQueries = false;
  bool isLoadedJobs = false;
  bool isLoadedPressReelase = false;
  bool isLoadedInvestors = false;
  @override
  void onInit() {
    super.onInit();
  }

  List<QueriesModel> queriesList = [];
  List<Data> queriesDataList = [];
  void getAllQueries() async {
    queriesList.clear();
    HomeRepo().getQueries().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoadedQueries = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            queriesList.add(QueriesModel.fromJson(decodedData));
            queriesDataList = queriesList.first.data!;
          }

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  searchQueries(String query) async {
    if (query.isNotEmpty) {
      queriesDataList = queriesList.first.data!
          .where((elem) => elem.firstname!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      queriesDataList = queriesList.first.data!;
    }
    update();
  }

  List<InvestorsModel> investorList = [];
  List<InvestorsModelData> investorDataList = [];
  void getAllInvestors() async {
    investorList.clear();
    HomeRepo().getInvestors().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoadedInvestors = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            investorList.add(InvestorsModel.fromJson(decodedData));
            investorDataList = investorList.first.data!;
          }

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  searchInvestors(String query) async {
    if (query.isNotEmpty) {
      investorDataList = investorList.first.data!
          .where((elem) => elem.firstname!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      investorDataList = investorList.first.data!;
    }
    update();
  }

  List<PressReleaseModel> pressList = [];
  List<PressReleaseModelData> pressDataList = [];
  void getAllPressRelase() async {
    pressList.clear();
    HomeRepo().getPressRelease().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoadedPressReelase = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            pressList.add(PressReleaseModel.fromJson(decodedData));
            pressDataList = pressList.first.data!;
          }

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  searchPressRelease(String query) async {
    if (query.isNotEmpty) {
      pressDataList = pressList.first.data!
          .where((elem) => elem.name!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      pressDataList = pressList.first.data!;
    }
    update();
  }

  List<JobApplyModel>jobApplyLIst = [];
  List<JobApplyModelData> jobApplyDataLIst = [];
  void getJobApplyLiast() async {
    pressList.clear();
    HomeRepo().getJobs().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoadedJobs = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            jobApplyLIst.add(JobApplyModel.fromJson(decodedData));
            jobApplyDataLIst = jobApplyLIst.first.data!;
          }

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  searchJobApply(String query) async {
    if (query.isNotEmpty) {
      jobApplyDataLIst = jobApplyLIst.first.data!
          .where((elem) => elem.firstname!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      jobApplyDataLIst = jobApplyLIst.first.data!;
    }
    update();
  }
}
