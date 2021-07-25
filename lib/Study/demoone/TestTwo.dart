import 'package:flutter/material.dart';

/**
 * 图片组件
 */
class TestTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片组件"),
      ),
      //     body: HomeContents(),        //加载网络图片
      // body: HomeContent(), //加载本地的图片
      //    body: CircularImage(),       //实现圆角图片
      //    body: CircularImages(),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text("加载网络图片"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeContents()));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text("加载本地的图片"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeContent()));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text("实现圆角图片"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CircularImage()));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text("实现圆角图片"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CircularImages()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 圆形图片--第一种方法 使用Container的特性 画圆实现
 */
class CircularImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://img0.baidu.com/it/u=1425165859,2689717355&fm=26&fmt=auto&gp=0.jpg"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

/**
 * 圆形图片--第二种方法 使用原生组件ClipOval实现，根据图片大小处理
 */
class CircularImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ClipOval(
            child: Image.network(
              "https://img0.baidu.com/it/u=2878754786,2292453248&fm=26&fmt=auto&gp=0.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * 加载本地图片
 * 1创建assets文件夹，并且在里面创建2.0x 3.0x 文件夹，分别放入对应同一张尺寸大小不一样的图片
 * 2在pubspec.yaml 文件assents下配置图片路径
 *    assets:
    - assets/images/
    - assets/2.0x/
    - assets/3.0x/

 */
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/images/icon_5.webp",
            alignment: Alignment.bottomCenter, //设置图片位置
            //      color: Colors.cyan,         //设置图片显示属性
            colorBlendMode: BlendMode.color,
            fit: BoxFit.contain, //设置图片显示方式 cover拆解全屏
            repeat: ImageRepeat.repeat, //平铺
          ),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

//加载网络图片
class HomeContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.network(
            "https://img0.baidu.com/it/u=2878754786,2292453248&fm=26&fmt=auto&gp=0.jpg",
            alignment: Alignment.bottomCenter,
            //设置图片位置
            color: Colors.cyan,
            //设置图片显示属性
            colorBlendMode: BlendMode.color,
            fit: BoxFit.contain,
            //设置图片显示方式 cover拆解全屏
            repeat: ImageRepeat.repeat, //平铺
          ),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
