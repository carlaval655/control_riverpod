import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'image_model.dart';

final imageNotifierProvider = StateNotifierProvider((ref) => ImageNotifier());

class ImageNotifier extends StateNotifier<ImageModel> {

  ImageNotifier() : super(ImageModel(imageUrl: ''));

  Future<void> updateImage() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final String imageUrl = data['message'];
      state = ImageModel(imageUrl:imageUrl);
    } else {
      throw Exception('Failed to load image');
    }
  }
}
