import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/postController.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1),
      body: Center(
        child: GetX<PostController>(
          init: PostController(),
          builder: (controller) {
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.posts[index].title.toString()),
                    subtitle: Text(controller.posts[index].body.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
