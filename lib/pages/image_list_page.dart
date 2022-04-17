import 'dart:ffi';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_windows_wallpaper/model/image_model.dart';
import 'package:flutter_windows_wallpaper/provider/image_list_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:win32/win32.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  late ImageListProvider imageListProvider;
  @override
  void initState() {
    imageListProvider = Provider.of<ImageListProvider>(context, listen: false);
    imageListProvider.getImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageListProvider>(builder: (_, provider, __) {
      if (provider.loading) {
        return const Center(
          child: ProgressRing(),
        );
      }
      return GridView.builder(
        itemCount: provider.imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          var image = provider.imageList[index];
          return GestureDetector(
            onTap: () => _showDialogToConfirm(image),
            child: Card(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    child: Image.network(
                      image.src?.medium ?? '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      image.photographer ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  _showDialogToConfirm(ImageModel image) {
    showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: const Text('Set Desktop Background'),
            content: const Text('Do you really want to set this image as desktop background?'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Apply'),
                onPressed: () async {
                  var response = await http.get(Uri.parse(image.src?.original ?? ''));
                  var uint8List = response.bodyBytes;
                  var tempDir = await getApplicationSupportDirectory();
                  File file = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}');
                  await file.writeAsBytes(uint8List);

                  //Settings wallpaper

                  final wallpaper = DesktopWallpaper.createInstance();
                  final pathPtr = TEXT(file.path);
                  wallpaper.SetWallpaper(nullptr, pathPtr);
                  showSnackbar(context, const Snackbar(content: Text('Wallpaper set!')));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
