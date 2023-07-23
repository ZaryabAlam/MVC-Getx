import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/todoModel.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  var todos = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        todos.assignAll(
            jsonData.map((todoJson) => TodoModel.fromJson(todoJson)));
      } else {
        // Handle the error
        print('Error: ${response.statusCode}');
      }
      isLoading.value = false; // Set isLoading to false when data is fetched
    } catch (e) {
      // Handle any other errors
      print('Error: $e');
      isLoading.value = false; // Set isLoading to false on error as well
    }
  }
}
