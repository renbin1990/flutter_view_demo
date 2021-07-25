
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget ({Key? key
  ,this.initValue : 0}) : super(key: key);

  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget > {
  late int _counter;

  /**
   * 第一次加载调用。
   */
  @override
  void initState() {
    //初始化状态
    _counter=widget.initValue;
    print("initState");
  }

  /**
   * ，它主要是用于构建Widget子树的，会在如下场景被调用：
      在调用initState()之后。
      在调用didUpdateWidget()之后。
      在调用setState()之后。
      在调用didChangeDependencies()之后。
      在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
   */
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("$_counter"),
          onPressed: (){
            setState(() {
              ++_counter;
            });

            // 查找父级最近的Scaffold对应的ScaffoldState对象
            // ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
            // //调用ScaffoldState的showSnackBar来弹出SnackBar
            // _state!.showSnackBar(
            //   SnackBar(
            //     content: Text("我是SnackBar"),
            //   ),
            // );

            // 直接通过of静态方法来获取ScaffoldState
            ScaffoldState _state=Scaffold.of(context);
            _state.showSnackBar(
              SnackBar(
                content: Text("我是SnackBar"),
              ),
            );
          },
        ),
      ),
    );
  }

  /**
   * 在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
   */
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  /**
   * 当State对象从树中被移除时，会调用此回调。
   */
  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  /**
   * 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
   */
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  /**
   * 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
   */
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  /**
   * 当State对象的依赖发生变化时会被调用
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
