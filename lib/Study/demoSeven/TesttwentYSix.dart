import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class TesttwentYSix extends StatefulWidget {
  const TesttwentYSix({Key? key}) : super(key: key);

  @override
  _TesttwentYSixState createState() => _TesttwentYSixState();
}

class _TesttwentYSixState extends State<TesttwentYSix> {
  final ImagePicker _picker = ImagePicker();

  _getVideo() async{
    final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
    if(image != null){
      String videoPath = image.path;
      Navigator.pushNamed(context, "/LocationVideoPlay",arguments: {
        "videoPath":videoPath
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("视频播放"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NetVideoPlayer();
                    }));
                  },
                  child: Text("网络视频播放")),
              ElevatedButton(onPressed: () {
                _getVideo();
              }, child: Text("本地视频播放")),
            ],
          )
        ],
      ),
    );
  }
}

class NetVideoPlayer extends StatefulWidget {
  const NetVideoPlayer({Key? key}) : super(key: key);

  @override
  _NetVideoPlayerState createState() => _NetVideoPlayerState();
}

class _NetVideoPlayerState extends State<NetVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  initState() {
    super.initState();
    _initVideo();
  }
  //初始化播放状态
  _initVideo() async {
    videoPlayerController = VideoPlayerController.network(
        'https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');
//    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    //页面关闭的时候销毁
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络视频播放"),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}

class LocationVideoPlay extends StatefulWidget {
  var arguments;

  LocationVideoPlay({Key? key,this.arguments}) : super(key: key);

  @override
  _LocationVideoPlayState createState() => _LocationVideoPlayState(this.arguments);
}

class _LocationVideoPlayState extends State<LocationVideoPlay> {
  var arguments;
  _LocationVideoPlayState(this.arguments);

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  initState() {
    super.initState();
    _initVideo();
  }
  //初始化播放状态
  _initVideo() async {
    videoPlayerController = VideoPlayerController.file(File(arguments["videoPath"]));
//    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    //页面关闭的时候销毁
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("本地视频播放"),),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
