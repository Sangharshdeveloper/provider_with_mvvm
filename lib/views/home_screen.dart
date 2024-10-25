import 'dart:collection';
import 'dart:convert';

import 'package:app/model/response_model.dart';
import 'package:app/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostViewModel> postList = [];

  @override
  void initState() {
    super.initState();
    Provider.of<PostViewModel>(context,listen: false).fetchPosts();
        
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
     
    final postViewModel =  Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: (postViewModel.isLoading)? CircularProgressIndicator() : (postViewModel.errorMessage != '') ? Text(postViewModel.errorMessage)
      : ListView.builder(
        itemCount: postViewModel.postList.length,
        itemBuilder: (context,index){
        
        return Text(postViewModel.postList[index].body.toString());
      }),
    );
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
