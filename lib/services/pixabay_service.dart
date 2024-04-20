import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pixbay/utils/env.dart';

class PixabayService {
  Dio dio = Dio();
  late Response response;

  Future<List> fetchImages() async {
    try {
      response = await dio.get(
          "https://pixabay.com/api/?key=${Env.apiKey}&q=yellow+flowers&image_type=photo&pretty=true&min_width=200&min_height=200&per_page=40");
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        final result = response.data["hits"] as List;
        return result;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("fetch images error: $e");
      return [];
    }
  }
}
