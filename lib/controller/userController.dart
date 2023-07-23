import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/userModel.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        users.assignAll(
            jsonData.map((userJson) => UserModel.fromJson(userJson)));
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
