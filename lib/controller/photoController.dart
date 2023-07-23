import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/photoModel.dart';

class PhotoController extends GetxController {
  var isLoading = true.obs;
  var photos = <PhotoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  void fetchPhotos() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        photos.assignAll(
            jsonData.map((photoJson) => PhotoModel.fromJson(photoJson)));
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
