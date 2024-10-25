import 'dart:convert';

import 'package:app/model/response_model.dart';
import 'package:app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PostViewModel extends ChangeNotifier {
  List<ResponseModel> postList = [];
  bool isLoading = false;
  String errorMessage = '';

  Future getPost() async {

    isLoading = true;
    notifyListeners();

    final Uri url = Uri.parse(AppConstant().apiUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResp = jsonDecode(response.body);
        postList =
            jsonResp.map((json) => ResponseModel.fromJson(json)).toList();
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
    
  }
}
