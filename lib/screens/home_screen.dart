import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixbay/controllers/home_controller.dart';
import 'package:pixbay/models/image_model.dart';
import 'package:pixbay/widgets/responsive_grid.dart';
import 'package:pixbay/widgets/reusable_widgets.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PixBay')),
      body: Center(
        child: ResponsiveGridView(
          itemCount: controller.displayImages.length,
          itemBuilder: (context, index) {
            final image = controller.displayImages[index];
            return imageTile(context, image);
          },
          // itemBuilder: (context, index) => Image.network(
          //   "https://picsum.photos/id/$index/200/200",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }

  // Widget imageTile(ImageModel image) {
  //   return Stack(
  //     children: [
  //       Image.network(
  //         image.previewUrl,
  //         fit: BoxFit.cover,
  //         height: 200,
  //         width: 200,
  //       ),
  //       Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Padding(
  //           padding: const EdgeInsets.only(bottom: 4),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Wrap(
  //                 children: [
  //                   const Icon(
  //                     Icons.favorite,
  //                     color: Colors.white,
  //                   ),
  //                   const SizedBox(
  //                     width: 4,
  //                   ),
  //                   Text(
  //                     image.likes.toString(),
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Wrap(
  //                 children: [
  //                   const Icon(
  //                     Icons.visibility,
  //                     color: Colors.white,
  //                   ),
  //                   const SizedBox(
  //                     width: 4,
  //                   ),
  //                   Text(
  //                     image.views.toString(),
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
