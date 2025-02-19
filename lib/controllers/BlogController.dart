import 'dart:convert';
import 'dart:io';
import 'package:archlelabsadmin/screens/blogs.dart/add_blogs.dart';
import 'package:archlelabsadmin/screens/blogs.dart/blogs.dart';
import 'package:archlelabsadmin/services/auth_repo.dart';
import 'package:archlelabsadmin/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/BlogModel.dart';
import '../routes/app_routes.dart';
import '../services/home_repo.dart';
import '../services/shared_pref.dart';

class BlogController extends GetxController {
  final body1 = TextEditingController();
  final body2 = TextEditingController();
  final body3 = TextEditingController();
  final title = TextEditingController();
  final subtitle = TextEditingController();

  bool isLoaded = false;
  List<BlogModel> blogsList = [];
  List<Items> blogsListItems = [];
  String id = "";
  @override
  void onInit() {
    super.onInit();

    print("dhn");
    getAllBlogs();
  }

  editBlog(Items item) {
    body1.text = item.body1.toString();
    body2.text = item.body2.toString();
    body3.text = item.body3.toString();
    title.text = item.title.toString();
    id = item.id.toString();
    subtitle.text = item.subTitle.toString();
    Get.to(AddBlog());
  }

  clearblog() {
    body1.clear();
    body2.clear();
    body3.clear();
    title.clear();
    id = "";
    subtitle.clear();
    update();
  }

  void getAllBlogs() async {
    blogsList.clear();
    HomeRepo().getBlogs().then((value) {
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          blogsListItems.clear();
          if (decodedData['data']!.length != 0) {
            blogsList.add(BlogModel.fromJson(decodedData));
            blogsListItems = blogsList.first.data!.items!;
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
          blogsList.clear();
          update();
          break;
      }
    });
  }

  Uint8List? images1;
  Uint8List? images2;

  Uint8List? images3;

  Future getImage(ImageSource img, count) async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: img,
      );
      if (image == null) return;

      final imageTemp = File(
        image.path,
      );
      switch (count) {
        case 1:
          images1 = await image.readAsBytes();
          files.insert(0, images1);

          update();
          break;
        case 2:
          images2 = await image.readAsBytes();
          files.insert(1, images2);
          update();
          break;
        case 3:
          images3 = await image.readAsBytes();
          files.insert(2, images3);
          update();
          break;
        default:
      }

      // setState(() {
    } on PlatformException catch (e) {
      print(e);
    }
  }

  List files = [];
  void submit() async {
    Loaders.showLoading('Loading...');
    List<Uint8List> imagesBytesList = [images1!];
    List<String> imageNames = ["ss.png"];
    HomeRepo()
        .createBlog([subtitle.text], title.text, body1.text, body2.text,
            body3.text, [files[0]], imageNames)
        .then((value) {
      print(value);
      Loaders.hideLoading();
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;

          clearblog();
          Get.offNamedUntil(
            Routes.blog,
            (route) => route.isFirst,
          );
          Loaders.successSnackBar(message: "Success", title: "Blog Updated");
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

  searchBlog(String query) async {
    if (query.isNotEmpty) {
      blogsListItems = blogsList.first.data!.items!
          .where((elem) => elem.title!.toLowerCase().contains(query))
          .toList();

      update();
    } else {
      blogsListItems = blogsList.first.data!.items!;
    }
    update();
  }

  void deleteBlog(blogid) async {
    Get.back();
    Loaders.showLoading('Loading...');

    HomeRepo().deleteBlog(blogid).then((value) {
      print(value);
      Loaders.hideLoading();
      switch (value!.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          Loaders.successSnackBar(message: "Success", title: "Blog Deleted");
          getAllBlogs();
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
