import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixbay/controllers/home_controller.dart';
import 'package:pixbay/widgets/responsive_grid.dart';
import 'package:pixbay/widgets/reusable_widgets.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PixBay')),
      body: GetX(
          init: HomeController(),
          initState: (_) {},
          builder: (_) {
            if (controller.imagesLoading.value) {
              return Center(
                  child: ResponsiveGridView(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return shimmer(
                    Container(
                      color: Colors.black,
                      height: 200,
                      width: 200,
                      child: const Center(
                        child: Text("Pics"),
                      ),
                    ),
                  );
                },
              ));
            }
            return Center(
              child: ResponsiveGridView(
                itemCount: controller.displayImages.length,
                itemBuilder: (context, index) {
                  final image = controller.displayImages[index];
                  return imageTile(context, image);
                },
              ),
            );
          }),
    );
  }
}
