import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_windows_wallpaper/pages/image_list_page.dart';
import 'package:flutter_windows_wallpaper/pages/search_image_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: _buildNavigationAppBar(),
      pane: _buildNavigationPane(),
      content: NavigationBody(
        index: selectedIndex,
        children: [
          ImageListPage(),
          SearchImagePage(),
        ],
      ),
    );
  }

  NavigationPane _buildNavigationPane() {
    return NavigationPane(
      selected: selectedIndex,
      onChanged: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      header: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 100,
        ),
      ),
      items: [
        PaneItem(
          icon: const Icon(FluentIcons.photo_collection),
          title: const Text('Image List'),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.search),
          title: const Text('Search Image'),
        )
      ],
    );
  }

  NavigationAppBar _buildNavigationAppBar() {
    return const NavigationAppBar(
      title: Text(
        'WallPaper App',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
