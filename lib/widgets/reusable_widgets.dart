import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pixbay/models/image_model.dart';
import 'package:pixbay/screens/image_details_screen.dart';

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
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );

Widget imageTile(BuildContext context, ImageModel image) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        createCustomPageRoute(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context) => ImageDetailsScreen(image: image),
        ),
      );
    },
    child: Stack(
      children: [
        Hero(
          tag: image.id,
          child: CachedNetworkImage(
            imageUrl: image.previewUrl,
            fit: BoxFit.cover,
            height: 200,
            width: 200,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
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
                      image.likes.toString(),
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
                      image.views.toString(),
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
  Duration transitionDuration = const Duration(milliseconds: 500),
}) {
  return PageRouteBuilder(
    transitionDuration: transitionDuration,
    pageBuilder: (context, animation, secondaryAnimation) =>
        pageBuilder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
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
