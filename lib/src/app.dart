import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'dart:convert';
import './Widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    var res = await http.get(url);
    var imageModel = ImageModel.fromJson(json.decode(res.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Images'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
