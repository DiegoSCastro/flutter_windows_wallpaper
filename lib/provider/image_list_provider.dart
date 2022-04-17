import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_windows_wallpaper/model/image_model.dart';
import 'package:flutter_windows_wallpaper/service/api_service.dart';

class ImageListProvider extends ChangeNotifier {
  final ApiService apiService;
  ImageListProvider({required this.apiService});

  bool loading = false;
  List<ImageModel> imageList = [];

  getImageList() async {
    loading = true;
    imageList = await apiService.getImage();
    loading = false;
    notifyListeners();
  }
}
