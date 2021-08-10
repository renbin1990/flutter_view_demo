import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesttwentYFive extends StatefulWidget {
  const TesttwentYFive({Key? key}) : super(key: key);

  @override
  _TesttwentYFiveState createState() => _TesttwentYFiveState();
}

class _TesttwentYFiveState extends State<TesttwentYFive> {

  final ImagePicker _picker = ImagePicker();
  XFile? _photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("相册，拍照"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this._photo == null?Text("请选择图片"):Image.file(File(_photo!.path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: (){
                  // requestPermission(0);
                  _takePhoto();
                }, child: Text("拍照")),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  // requestPermission(0);
                  _galleryPhoto();
                }, child: Text("相册")),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  // requestPermission(0);
                  _choicePhoto();
                }, child: Text("相册多选")),
              ],
            )
          ],
        ),
      ),
    );
  }

  _takePhoto() async{
    XFile? photo = await _picker.pickImage(source: ImageSource.camera,maxWidth: 400,maxHeight: 400);
    if(photo != null){
      setState(() {
        this._photo = photo;
      });
    }
  }

  _galleryPhoto() async{
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery,maxWidth: 400,maxHeight: 400);
    if(photo != null){
      setState(() {
        this._photo = photo;
      });
    }
  }

  _choicePhoto() async{
    // Pick multiple images
    final List<XFile>? images = await _picker.pickMultiImage();
  }
}
