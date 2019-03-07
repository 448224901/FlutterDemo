import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart' as ImageSelect;
import 'package:flutter/material.dart';

class ImagePickWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagePickPage();
  }
}

class ImagePickPage extends StatefulWidget {
  @override
  _ImagePickPageState createState() => _ImagePickPageState();
}

class _ImagePickPageState extends State<ImagePickPage> {
  File _image;

  Future getImage() async {
    var image = await ImageSelect.ImagePicker.pickImage(source: ImageSelect.ImageSource.gallery);
    print('hello');
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择图片'),
      ),
      body: Center(
//      child: ,
        child: _image == null ? Text('No image selected') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
