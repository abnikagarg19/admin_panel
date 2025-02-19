import 'dart:convert';
import 'package:archlelabsadmin/utils/app_urls.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as aa;
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import '../services/shared_pref.dart';

class THttpHelper {
  static const String _baseUrl =
      AppUrls.BASE_URL; // Replace with your API base URL

  // Helper method to make a GET request
  Future<Response> get(String endpoint, {bool useToken = true}) async {
    var headers = _buildHeaders(useToken);
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  Future<Response> postwithoutbody(String endpoint, dynamic data,
      {bool useToken = true}) async {
    try {
      var headers = _buildHeaders(useToken);
      final response = await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        body: data,
      );
      return _handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: "No Internet");
    }
  }

  Future<Response> post(String endpoint, dynamic data,
      {bool useToken = true}) async {
    try {
      var headers = _buildHeaders(useToken);
      final response = await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        headers: headers,
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: "No Internet");
    }
  }

  // Helper method to make a POST request with Multipart
  Future<Response> postMultipart(String endpoint, http.MultipartRequest request,
      {bool useToken = true}) async {
    try {
 

      // Add authorization header
      var token = PreferenceUtils.getUserToken();
      request.headers['Authorization'] = 'Bearer $token';
      var response = await request.send();
      // Check the response status

      //var responseBody = await response.stream.bytesToString();

      return  Response(
     // body: response.stream.bytesToString(),
      
      headers: response.headers,
      statusCode: response.statusCode,
    );
    } catch (e) {
      return const Response(statusCode: 1, statusText: "No Internet");
    }
  }

  // Helper method to make a PUT request
  Future<Response> put(String endpoint, dynamic data,
      {bool useToken = true}) async {
    var headers = _buildHeaders(useToken);
    final response = await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  Future<Response> delete(String endpoint, {bool useToken = true}) async {
    var headers = _buildHeaders(useToken);
    final response = await http.delete(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  // Build request headers dynamically
  Map<String, String> _buildHeaders(bool useToken) {
    Map<String, String> headers = {
      "content-type": "application/json",
    };
    if (useToken) {
      var token = PreferenceUtils.getUserToken();
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // Handle the HTTP response
  Response _handleResponse(response) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: response.body,
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
    );
    // if (_response.statusCode != 200 &&
    //     _response.body != null &&
    //     _response.body is! String) {
    //   if (_response.body.toString().startsWith('{response_code:')) {
    //     // ErrorsModel _errorResponse = ErrorsModel.fromJson(_response.body);
    //     _response = Response(
    //         statusCode: _response.statusCode,
    //         body: _response.body,
    //         statusText: _response.statusText);
    //   } else if (_response.body.toString().startsWith('{message')) {
    //     _response = Response(
    //         statusCode: _response.statusCode,
    //         body: _response.body,
    //         statusText: _response.body['message']);
    //   }
    // } else if (_response.statusCode != 200 && _response.body == null) {
    //   _response = Response(statusCode: 0, statusText: noInternetMessage);
    // }
    // if (Foundation.kDebugMode) {
    //   debugPrint(
    //       '====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    // }
    return _response;
  }
}
