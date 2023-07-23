import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/userController.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1),
      body: Center(
        child: GetX<UserController>(
          init: UserController(),
          builder: (controller) {
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.users[index].name.toString()),
                    subtitle: Text(controller.users[index].email.toString()),
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
