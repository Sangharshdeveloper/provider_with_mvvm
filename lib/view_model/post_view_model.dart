import 'dart:convert';

import 'package:app/model/response_model.dart';
import 'package:app/services/api_service.dart';
import 'package:app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PostViewModel extends ChangeNotifier {
  List<ResponseModel> postList = [];
  bool isLoading = false;

  String errorMessage = "";
  final ApiService apiService;

  PostViewModel({required this.apiService});

  Future fetchPosts() async {
    isLoading = true;
    notifyListeners();
    try {
      postList = await apiService.getPosts();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
