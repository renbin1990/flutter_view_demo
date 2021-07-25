import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'Study/baseDart/TipRoute.dart';
import 'Study/demoFour/TestTwelve.dart';
import 'myProject/main/MainTab.dart';


void main() {
  runApp(
   //   const MyApp()
   //   MyFirstHome()
    //  TestOne()         //Container组件 和 Text组件
  //    TestTwo()         //c图片组件
  //    TestThree()       //list组件
  //    TestFour()      //GridView
  //    TestFive()      // row cloumn expanded
  //    TestSix()       //stack组件 alin positioned组件
 //     TestSeven()       //AspectRatio Card组件
 //     TestEight()       //Wrap组件
  //    TestNine()       //StatefulWidget组件
  //    TestTen()       //d底部导航BottemNativigationBar组件
   //   TestEleven()       //页面跳转。普通路由传值
    //  TestTwelve()       //命名路由传值
      MainTab()
  );

  // runApp(Center(
  //   child: Text(
  //     "你好 flutter",
  //     textDirection: TextDirection.ltr,
  //   ),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordpair  = new WordPair.random();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text(wordpair.toString()),
              textColor: Colors.blue,
                onPressed: () async {
         //       Navigator.pushNamed(context, "new_page");
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return TipRoute(text: "我是提示xxxx");
                      }
                      )
                  );
                  //输出`TipRoute`路由返回结果
                  print("路由返回值: $result");
                }
              // onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context){
              //     return NewRoute();
              //   }));
              // },
            ),
            FlatButton(
          child: Text("打开提示页"),
              textColor: Colors.amber,
              onPressed: () async {
                var result = await Navigator.push(context,
                MaterialPageRoute(builder: (context){
                 return TipRoute(text: "123124");
                }
                )
                );
              },
            ),
            RandomWordsWidget(),
            ImageWidgt(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ImageWidgt  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/icon_5.webp");
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Text("this is new route"),
      ),
    );
  }
}


