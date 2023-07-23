import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx/model/postModel.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var isLoading = true.obs;
  var posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        posts.assignAll(
            jsonData.map((postJson) => PostModel.fromJson(postJson)));
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
