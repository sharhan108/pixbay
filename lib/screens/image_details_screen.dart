import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pixbay/models/image_model.dart';
import 'package:pixbay/widgets/reusable_widgets.dart';

class ImageDetailsScreen extends StatelessWidget {
  final ImageModel image;

  const ImageDetailsScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: "image_${image.id}",
            child: CachedNetworkImage(
              imageUrl: image.previewUrl,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
