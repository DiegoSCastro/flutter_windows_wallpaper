import 'dart:convert';

import 'package:flutter_windows_wallpaper/model/image_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const API_KEY = '563492ad6f917000010000014316da24e60b400a87a04786b244dc10';

  static const exemple = 'https://api.pexels.com/v1/curated?page=2&per_page=40';
  static const BASE_URL = 'https://api.pexels.com/v1/';
  static const headers = {'Authorization': API_KEY};

  int page = 2;
  int perPage = 40;

  Future<List<ImageModel>> getImage() async {
    var response = await http.get(
        Uri.parse(
          '${BASE_URL}curated?page=$page&per_page=$perPage',
        ),
        headers: headers);
    if (response.statusCode == 200) {
      List<ImageModel> imageList = [];
      var body = jsonDecode(response.body);
      List<dynamic> photoList = body['photos'];
      for (var photo in photoList) {
        ImageModel imageModel = ImageModel.fromJson(photo);
        imageList.add(imageModel);
      }
      return imageList;
    } else {
      return [];
    }
  }
}
