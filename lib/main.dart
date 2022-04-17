import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_windows_wallpaper/pages/home.dart';
import 'package:flutter_windows_wallpaper/provider/image_list_provider.dart';
import 'package:flutter_windows_wallpaper/service/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageListProvider>(
      create: (context) => ImageListProvider(apiService: ApiService()),
      child: FluentApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
