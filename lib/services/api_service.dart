import 'dart:convert';

import 'package:app/model/response_model.dart';
import 'package:app/utils/app_constant.dart';
import 'package:app/view_model/post_view_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = AppConstant().apiUrl;

  Future<List<ResponseModel>> getPosts() async {
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> list = jsonDecode(response.body);
      return list.map((e) => ResponseModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
