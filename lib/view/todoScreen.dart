import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/todoController.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1),
      body: Center(
        child: GetX<TodoController>(
            init: TodoController(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.todos[index].title.toString()),
                        subtitle:
                            Text(controller.todos[index].completed.toString()),
                      );
                    });
              }
            }),
      ),
    );
  }
}
