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
import '../routes/app_routes.dart';
import '../screens/dashboard/add_designation.dart';
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
    location.text = item.location.toString();

    id = item.id.toString();
    Get.to(AddDesignation());
  }

  clearDesignation() {
    title.clear();
    des.clear();
    exp.clear();
    skills.clear();
    location.clear();
    id = "";
    update();
  }

  void getAllDesignation() async {
    designationList.clear();
    designationDataList.clear();
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

    HomeRepo()
        .addDesignation(
            title.text, exp.text, des.text, location.text, skills.text,id)
        .then((value) {
      print(value);
      Loaders.hideLoading();
      switch (value!.statusCode) {
        case 200:
          clearDesignation();
          Get.offNamedUntil(
            Routes.designation,
            (route) => false,
          );
          Loaders.successSnackBar(
              message: "Success", title: "Designation Updated");
          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          Loaders.errorSnackBar(
              message: "Error", title: "Something went wrong");
          break;

        default:
          Loaders.errorSnackBar(
              message: "Error", title: "Something went wrong");
          break;
      }
    });
  }

  searc(String query) async {
    if(designationList.isEmpty){
      return;
    }
    if (query.isNotEmpty) {
      designationDataList = designationList.first.data!
          .where((elem) => elem.jobTitle!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      designationDataList = designationList.first.data!;
    }
    update();
  }

  void deleteDesignation(id) async {
    Get.back();
    Loaders.showLoading('Loading...');

    HomeRepo().deleteDesignation(id).then((value) {
      print(value);
      Loaders.hideLoading();
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          Loaders.successSnackBar(
              message: "Success", title: "Designation removed");
          getAllDesignation();
          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          Loaders.errorSnackBar(
              message: "Error", title: "Something went wrong");
          break;

        default:
          Loaders.errorSnackBar(
              message: "Error", title: "Something went wrong");
          break;
      }
    });
  }
}
