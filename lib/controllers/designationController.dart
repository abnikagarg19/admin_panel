import 'dart:convert';
import 'dart:io';
import 'package:archlelabsadmin/models/DesignationModel.dart';
import 'package:archlelabsadmin/screens/blogs.dart/add_blogs.dart';
import 'package:archlelabsadmin/screens/blogs.dart/blogs.dart';
import 'package:archlelabsadmin/screens/team/add_team.dart';
import 'package:archlelabsadmin/screens/team/teams.dart';
import 'package:archlelabsadmin/services/auth_repo.dart';
import 'package:archlelabsadmin/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../services/home_repo.dart';
import '../services/shared_pref.dart';

class DesignationController extends GetxController {
  final title = TextEditingController();
  final mode = TextEditingController();
  final exp = TextEditingController();
  final skills = TextEditingController();
  final location = TextEditingController();
  final des = TextEditingController();
  bool isLoaded = false;
  List<DesignationModel> designationList = [];
  List<Data> designationDataList = [];
  String id = "";
  @override
  void onInit() {
    super.onInit();

    print("dhn");
    getAllDesignation();
  }

  editDesignation(Data item) {
    title.text = item.jobTitle.toString();
    des.text = item.notes.toString();
    exp.text = item.experience.toString();
    skills.text = item.skills.toString();
    id = item.id.toString();
    mode.text = item.mode.toString();
    Get.to(AddTeam());
  }

  clearDesignation() {
    title.clear();
    des.clear();
    exp.clear();
    skills.clear();
    id = "";
    mode.clear();
    update();
  }

  void getAllDesignation() async {
    designationList.clear();
    HomeRepo().getDesignation().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            designationList.add(DesignationModel.fromJson(decodedData));
            designationDataList = designationList.first.data!;
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

  void submit() async {
    Loaders.showLoading('Loading...');

    // HomeRepo()
    //     .createTeam(name.text, des.text, role.text, experience.text,
    //         linkedin.text, skills.text)
    //     .then((value) {
    //   print(value);
    //   Loaders.hideLoading();
    //   switch (value!.statusCode) {
    //     case 200:
    //       final decodedData = jsonDecode(value.body);

    //       clearTeam();
    //       Get.to(Team());
    //       Loaders.successSnackBar(message: "Success", title: "Team Updated");
    //       update();
    //       break;
    //     case 401:
    //       Get.offAndToNamed("/login");
    //       Loaders.errorSnackBar(
    //           message: "Error", title: "Something went wrong");
    //       break;

    //     default:
    //       Loaders.errorSnackBar(
    //           message: "Error", title: "Something went wrong");
    //       break;
    //   }
    // });
  }

  searchTeam(String query) async {
  //   if (query.isNotEmpty) {
  //     teamDataList = teamList.first.data!
  //         .where((elem) => elem.name!.toLowerCase().contains(query))
  //         .toList();

  //     update();
  //   } else {
  //     teamDataList = teamList.first.data!;
  //   }
  //   update();
  // }
  }
}
