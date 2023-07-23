import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controller/photoController.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1),
      body: Center(
        child: GetX<PhotoController>(
          init: PhotoController(),
          builder: (controller) {
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.photos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(controller.photos[index].id.toString()),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.black12,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //       image: NetworkImage(
                        //           controller.photos[index].url.toString())),
                        // ),
                        // child: Center(
                        //     child: Text(
                        //   controller.photos[index].id.toString(),
                        //   style: const TextStyle(
                        //       fontSize: 36, color: Colors.white),
                        // )),
                        child: CachedNetworkImage(
                          imageUrl: controller.photos[index].url.toString(),
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: CircularProgressIndicator(strokeWidth: 6),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      ListTile(
                        // title: Text(controller.photos[index].id.toString()),
                        subtitle:
                            Text(controller.photos[index].title.toString()),
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),
                    ],
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
