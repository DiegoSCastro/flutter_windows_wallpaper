import 'package:flutter/material.dart';

class SearchImagePage extends StatefulWidget {
  const SearchImagePage({Key? key}) : super(key: key);

  @override
  _SearchImagePageState createState() => _SearchImagePageState();
}

class _SearchImagePageState extends State<SearchImagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Image Search'),
    );
  }
}
