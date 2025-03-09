import 'dart:convert';
import 'dart:io';
import 'package:archlelabsadmin/models/TeamModel.dart';
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
import '../services/home_repo.dart';
import '../services/shared_pref.dart';

class TeamController extends GetxController {
  final name = TextEditingController();
  final experience = TextEditingController();
  final role = TextEditingController();
  final des = TextEditingController();
  final skills = TextEditingController();
  final linkedin = TextEditingController();

  bool isLoaded = false;
  List<TeamModel> teamList = [];
  List<Data> teamDataList = [];
  String id = "";
    String profileUrl = "";
  @override
  void onInit() {
    super.onInit();

    print("dhn");
    getAllteams();
  }

  editTeam(Data item) {

    name.text = item.name.toString();
    des.text = item.description.toString();
        role.text = item.role.toString();

    experience.text = item.experience.toString();
    linkedin.text = item.linkedin.toString();
    id = item.id.toString();
    skills.text = item.skills.toString();
    profileUrl=item.profileUrl.toString();
    Get.to(AddTeam());
  }

  clearTeam() {
    name.clear();
    des.clear();
    role.clear();
    experience.clear();
    linkedin.clear();
    id = "";
    profileUrl="";
    skills.clear();
    update();
  }

  void getAllteams() async {
    teamList.clear();
    HomeRepo().getTeams().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);

          if (decodedData['data']!.length != 0) {
            teamList.add(TeamModel.fromJson(decodedData));
            teamDataList = teamList.first.data!;
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

  Uint8List? images1;

  Future getImage(ImageSource img) async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: img,
        imageQuality: 100
      );
      if (image == null) return;

      final imageTemp = File(
        image.path,
      );
      images1 = await image.readAsBytes();
      profileUrl="";
      update();
      // setState(() {
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void submit() async {
    Loaders.showLoading('Loading...');

    HomeRepo()
        .createTeam(name.text, des.text, role.text, experience.text,
            linkedin.text, skills.text, images1,id)
        .then((value) {
      print(value.statusCode);
      Loaders.hideLoading();
      switch (value.statusCode) {
        case 200:
          clearTeam();
          Get.offNamedUntil(
            Routes.team,
            (route) => route.isFirst,
          );
          Loaders.successSnackBar(message: "Success", title: "Team Updated");
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

  searchTeam(String query) async {
    if(teamList.isEmpty){
      return;
    }
    if (query.isNotEmpty) {
      teamDataList = teamList.first.data!
          .where((elem) => elem.name!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      teamDataList = teamList.first.data!;
    }
    update();
  }

  void deleteTeam(teamId) async {
    Get.back();
    Loaders.showLoading('Loading...');

    HomeRepo().deleteTeam(teamId).then((value) {
      print(value);
      Loaders.hideLoading();
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          Loaders.successSnackBar(message: "Success", title: "Team removed");
          getAllteams();
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
