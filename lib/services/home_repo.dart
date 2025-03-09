import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:archlelabsadmin/utils/app_urls.dart';
import 'package:get/get.dart';
// import 'package:dio/Dio.dart' as dio;
import '../client/http_client.dart';
import 'package:http_parser/http_parser.dart';

class HomeRepo {
  Future<dynamic> createBlog(
      List sub_title,
      String title,
      String body1,
      String body2,
      String body3,
      imageBytesList, // List of image bytes
      List<String> imageNames,
      id) async {
    var uri = id == ""
        ? Uri.parse(AppUrls.BASE_URL +
            AppUrls.createBlogs +
            "?title=$title&body1=$body1&body2=$body2&body3=$body3")
        : Uri.parse(AppUrls.BASE_URL +
            AppUrls.createBlogs +
            "?title=$title&body1=$body1&body2=$body2&body3=$body3&blog_id$id");
    var request = http.MultipartRequest('POST', uri);

    // Add multiple sub_title fields
    // for (var subTitle in sub_title) {
    request.fields['sub_title'] = sub_title[0];
    // }

    // Add image files
    for (int i = 0; i < imageBytesList.length; i++) {
      var multipartFile = http.MultipartFile.fromBytes(
        'images', // Field name on the server
        imageBytesList[i],
        filename: "aa.png",
      );
      request.files.add(multipartFile);
    }
    return await THttpHelper().postMultipart(AppUrls.createBlogs, request);
  }

  Future<dynamic> getBlogs() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.getBlogs + "?page=1&size=50");
  }

  Future<dynamic> createTeam(String name, String des, String role, String exp,
      String linkedin, String skills, image, id) async {
    var uri = id == ""
        ? Uri.parse(AppUrls.BASE_URL +
            AppUrls.createTeam +
            "?name=$name&description=$des&role=$role&experience=$exp&skills=$skills&linkedin=$linkedin")
        : Uri.parse(AppUrls.BASE_URL +
            AppUrls.createTeam +
            "?name=$name&description=$des&role=$role&experience=$exp&skills=$skills&linkedin=$linkedin&team_id=$id");
    var request = http.MultipartRequest('POST', uri);

    if (image != null) {
      var multipartFile = http.MultipartFile.fromBytes(
        'filedata', // This should match the parameter name in your FastAPI endpoint
        image,

        filename: "aa" + name.trim() + ".jpg",
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);
    }

    return await THttpHelper().postMultipart(AppUrls.createTeam, request);
  }

  Future<dynamic> getTeams() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.getTeam);
  }

  Future<dynamic> getQueries() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.get_all_querie);
  }

  Future<dynamic> getPressRelease() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.get_all_pressrelease);
  }

  Future<dynamic> getJobs() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.get_all_job);
  }

  Future<dynamic> getInvestors() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.get_all_invest);
  }

  Future<dynamic> getDesignation() async {
    var map = Map<String, dynamic>();

    return await THttpHelper().get(AppUrls.getDesignation);
  }

  Future<dynamic> addDesignation(title, exp, des, location, skillsData,
      offersData, responsibilitiesData, qualificationsData, jobtype, id) async {
    var map = Map<String, dynamic>();
    var data = {
      "job_title": title,
      "mode": "Online",
      "experience": "$exp",
      "skills": skillsData,
      "location": "$location",
      "date": "${DateTime.now()}",
      "notes": "$des",
      "description": "$des",
      "qualification": qualificationsData,
      "keyresponsibilty": responsibilitiesData,
      "offer": offersData,
      "jobtype": jobtype
    };
    return await id == ""
        ? THttpHelper().post(AppUrls.createDesignation, data)
        : THttpHelper()
            .post(AppUrls.createDesignation + "?career_id=$id", data);
  }

  Future<dynamic> deleteTeam(team_id) async {
    var map = Map<String, dynamic>();

    return await THttpHelper().delete(AppUrls.deleteTeam + "?team_id=$team_id");
  }

  Future<dynamic> deleteDesignation(id) async {
    var map = Map<String, dynamic>();

    return await THttpHelper()
        .delete(AppUrls.deleteDesignation + "?career_id=$id");
  }

  Future<dynamic> deleteBlog(blogId) async {
    var map = Map<String, dynamic>();

    return await THttpHelper().delete(AppUrls.deleteBlog + "?blog_id=$blogId");
  }
}
