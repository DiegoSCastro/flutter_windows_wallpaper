import 'dart:convert';

import 'package:flutter_windows_wallpaper/model/src.dart';

/// id : 11645359
/// width : 4000
/// height : 4000
/// url : "https://www.pexels.com/photo/refugees-v-4-11645359/"
/// photographer : "Roman Kaiuk"
/// photographer_url : "https://www.pexels.com/@romakaiuk"
/// photographer_id : 2087542
/// avg_color : "#393631"
/// src : {"original":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg","large2x":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","large":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&h=650&w=940","medium":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&h=350","small":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&h=130","portrait":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800","landscape":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200","tiny":"https://images.pexels.com/photos/11645359/pexels-photo-11645359.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"}
/// liked : false
/// alt : "Refugees v.4"

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));
String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) {
    _id = id;
    _width = width;
    _height = height;
    _url = url;
    _photographer = photographer;
    _photographerUrl = photographerUrl;
    _photographerId = photographerId;
    _avgColor = avgColor;
    _src = src;
    _liked = liked;
    _alt = alt;
  }

  ImageModel.fromJson(dynamic json) {
    _id = json['id'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _photographer = json['photographer'];
    _photographerUrl = json['photographer_url'];
    _photographerId = json['photographer_id'];
    _avgColor = json['avg_color'];
    _src = json['src'] != null ? Src.fromJson(json['src']) : null;
    _liked = json['liked'];
    _alt = json['alt'];
  }
  int? _id;
  int? _width;
  int? _height;
  String? _url;
  String? _photographer;
  String? _photographerUrl;
  int? _photographerId;
  String? _avgColor;
  Src? _src;
  bool? _liked;
  String? _alt;
  ImageModel copyWith({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) =>
      ImageModel(
        id: id ?? _id,
        width: width ?? _width,
        height: height ?? _height,
        url: url ?? _url,
        photographer: photographer ?? _photographer,
        photographerUrl: photographerUrl ?? _photographerUrl,
        photographerId: photographerId ?? _photographerId,
        avgColor: avgColor ?? _avgColor,
        src: src ?? _src,
        liked: liked ?? _liked,
        alt: alt ?? _alt,
      );
  int? get id => _id;
  int? get width => _width;
  int? get height => _height;
  String? get url => _url;
  String? get photographer => _photographer;
  String? get photographerUrl => _photographerUrl;
  int? get photographerId => _photographerId;
  String? get avgColor => _avgColor;
  Src? get src => _src;
  bool? get liked => _liked;
  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['width'] = _width;
    map['height'] = _height;
    map['url'] = _url;
    map['photographer'] = _photographer;
    map['photographer_url'] = _photographerUrl;
    map['photographer_id'] = _photographerId;
    map['avg_color'] = _avgColor;
    if (_src != null) {
      map['src'] = _src?.toJson();
    }
    map['liked'] = _liked;
    map['alt'] = _alt;
    return map;
  }
}
