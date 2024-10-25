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
  @override
  void initState() {
    super.initState();
    Provider.of<PostViewModel>(context,listen: false).getPost();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    // postViewModel.getPost();

    return Scaffold(
      appBar: AppBar(),
      body: postViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : postViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(postViewModel.errorMessage))
              : ListView.builder(
                  itemCount: postViewModel.postList.length,
                  itemBuilder: (context, index) {
                    final post = postViewModel.postList[index];
                    return ListTile(
                      title: Text(post.title.toString()),
                      subtitle: Text(post.body.toString()),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postViewModel.getPost();
        },
        child: const Icon(Icons.refresh),
      ),
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
