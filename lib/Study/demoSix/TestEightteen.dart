import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_view_demo/res/ListData.dart';

class TestEightteen extends StatefulWidget {
  const TestEightteen({Key? key}) : super(key: key);

  @override
  _TestEightteenState createState() => _TestEightteenState();
}

class _TestEightteenState extends State<TestEightteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("引导页轮播"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashContent()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Banner轮播"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BannerContent()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("卡片轮播"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardContent()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("其他轮播"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OtherContent()));
            },
          ),
        ],
      ),
    );
  }
}

class OtherContent extends StatefulWidget {
  const OtherContent({Key? key}) : super(key: key);

  @override
  _OtherContentState createState() => _OtherContentState();
}

class _OtherContentState extends State<OtherContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: new CustomLayoutOption(
              startIndex: -1,
              stateCount: 3
          ).addRotate([
            -45.0/180,
            0.0,
            45.0/180
          ]).addTranslate([
            new Offset(-370.0, -40.0),
            new Offset(0.0, 0.0),
            new Offset(370.0, -40.0)
          ]),
          itemWidth: 300.0,
          itemHeight: 200.0,
          itemBuilder: (context, index) {
            return new Container(
       //       color: Colors.grey,
              child: new Center(
                child: Image.network(
                  listData[index]["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: listData.length),
    );
  }
}


class CardContent extends StatefulWidget {
  const CardContent({Key? key}) : super(key: key);

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            listData[index]["imageUrl"],
            fit: BoxFit.fill,
          );
        },
        itemCount: listData.length,
        itemWidth: 300.0,
        itemHeight: 400.0,
        layout: SwiperLayout.TINDER,
      ),
    );
  }
}


class BannerContent extends StatefulWidget {
  const BannerContent({Key? key}) : super(key: key);

  @override
  _BannerContentState createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banner轮播"),
      ),
      body: Column(
        children: [
          //在Column中不能直接添加Swiper 需要在外层包一个Container组件
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    listData[index]["imageUrl"],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: listData.length,
                pagination: new SwiperPagination(),
                loop: false,
                index: 2,
                autoplay: true,
                //自动轮播
                duration: 1000,
                //   control: new SwiperControl(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [Text("我的是文本 哈哈哈")],
          )
        ],
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            listData[index]["imageUrl"],
            fit: BoxFit.fill,
          );
        },
        itemCount: listData.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
