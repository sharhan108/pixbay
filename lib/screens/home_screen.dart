import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixbay/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PixBay')),
    );
  }
}
