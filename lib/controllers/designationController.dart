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
  final jobType = TextEditingController();
  final location = TextEditingController();
  final des = TextEditingController();
  bool isLoaded = false;
  List<DesignationModel> designationList = [];
  List<Data> designationDataList = [];
  List<TextEditingController> responsibilities = [];
  List<TextEditingController> qualifications = [];
  List<Map<String, TextEditingController>> offers = [];

  String id = "";
  @override
  void onInit() {
    super.onInit();
 
    offers.add({
      "title": TextEditingController(),
      "description": TextEditingController(),
    });
    qualifications.add(TextEditingController());
    responsibilities.add(TextEditingController());   skills.add({
      "title": TextEditingController(),
      "description": TextEditingController(),
    });
    update();

    print("dhn");
    getAllDesignation();
  }

  /// Add a new offer entry
  void addOffer() {
    offers.add({
      "title": TextEditingController(),
      "description": TextEditingController(),
    });
    update();
  }

  void removeOffer(int index) {
    offers.removeAt(index);
    update();
  }

  editDesignation(Data item) {
    title.text = item.jobTitle.toString();
    des.text = item.notes.toString();
    exp.text = item.experience.toString();
   skills = item.skills!.map((skill) {
      return {
        "title": TextEditingController(text: skill.title),
        "description": TextEditingController(text: skill.description),
      };
    }).toList();
    offers = item.offer!.map((offers) {
      return {
        "title": TextEditingController(text: offers.title),
        "description": TextEditingController(text: offers.description),
      };
    }).toList();
  qualifications.add(TextEditingController(text:item.qualification.toString()));
    location.text = item.location.toString();

    id = item.id.toString();
    Get.to(AddDesignation());
  }

  clearDesignation() {
    title.clear();
    des.clear();
    exp.clear();
 
    location.clear();
    id = "";
    update();
  }

  List<Map<String, TextEditingController>> skills = [];

  void addSkill() {
    skills.add({
      "title": TextEditingController(),
      "description": TextEditingController(),
    });
    update();
  }

  void removeSkill(int index) {
    skills.removeAt(index);
    update();
  }

  void addResponsibility() {
    responsibilities.add(TextEditingController());
    update();
  }

  void removeResponsibility(int index) {
    responsibilities.removeAt(index);
    update();
  }

  void addQualification() {
    qualifications.add(TextEditingController());
    update();
  }

  void removeQualification(int index) {
    qualifications.removeAt(index);
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
    List<Map<String, String>> skillsData = skills.map((skill) {
      return {
        "title": skill["title"]!.text,
        "description": skill["description"]!.text,
      };
    }).toList();

    List<Map<String, String>> offersData = offers.map((offer) {
      return {
        "title": offer["title"]!.text,
        "description": offer["description"]!.text,
      };
    }).toList();

    List<String> responsibilitiesData =
        responsibilities.map((res) => res.text).toList();

    List<String> qualificationsData =
        qualifications.map((qual) => qual.text).toList();

    // Submit the data
    HomeRepo()
        .addDesignation(
            title.text,
            exp.text,
            des.text,
            location.text,
            skillsData,
            offersData,
            responsibilitiesData,
            qualificationsData,jobType.text,
            id)
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
    if (designationList.isEmpty) {
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
