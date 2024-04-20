import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixbay/models/image_model.dart';
import 'package:pixbay/services/pixabay_service.dart';

class HomeController extends GetxController {
  final pixabayApiService = PixabayService();
  RxBool imagesLoading = true.obs;
  RxList<ImageModel> displayImages = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImagesFromPixabay();
  }

  Future<void> fetchImagesFromPixabay() async {
    try {
      imagesLoading(true);
      final images = await pixabayApiService.fetchImages();
      if (images.isNotEmpty) {
        final imageModels =
            images.map((image) => ImageModel.fromJson(image)).toList();
        displayImages.assignAll(imageModels);
        debugPrint(displayImages.length.toString());
        imagesLoading(false);
      }
    } catch (e) {
      debugPrint('Error fetchImagesFromPixabay: $e');
      imagesLoading(false);
    }
  }
}
