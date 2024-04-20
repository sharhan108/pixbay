import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pixbay/models/image_model.dart';
import 'package:pixbay/screens/image_details_screen.dart';
import 'package:pixbay/utils/common_functions.dart';
import 'package:shimmer/shimmer.dart';

Widget kWidth(double width) {
  return SizedBox(
    width: width,
  );
}

Widget kHeight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget backButton() => GestureDetector(
      onTap: () => Get.back(),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );

Widget imageTile(BuildContext context, ImageModel image) {
  return GestureDetector(
    onTap: () {
      // Get.to(() => ImageDetailsScreen(image: image));
      Navigator.push(
        context,
        createCustomPageRoute(
          pageBuilder: (context) => ImageDetailsScreen(image: image),
        ),
      );
    },
    child: Stack(
      children: [
        Hero(
          tag: image.id,
          child: CachedNetworkImage(
            imageUrl: image.largeImageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: 200,
            placeholder: (context, url) =>
                const Center(child: CupertinoActivityIndicator()),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    kWidth(4),
                    Text(
                      image.likes.toString().shortenNumber(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    kWidth(4),
                    Text(
                      image.views.toString().shortenNumber(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Route createCustomPageRoute({
  required Widget Function(BuildContext) pageBuilder,
  Duration transitionDuration = const Duration(milliseconds: 300),
}) {
  return PageRouteBuilder(
    transitionDuration: transitionDuration,
    pageBuilder: (context, animation, secondaryAnimation) =>
        pageBuilder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
      // return SlideTransition(
      //   position: offsetAnimation,
      //   child: child,
      // );
    },
  );
}

Widget shimmer(Widget widget) {
  final colorTheme = Theme.of(Get.context!);

  return Shimmer(
      period: const Duration(milliseconds: 800),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
          // colorTheme.dividerColor,
          // colorTheme.dividerColor,
          // colorTheme.dividerColor,
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      child: widget);
}
