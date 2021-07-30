import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestSixteen extends StatefulWidget {
  const TestSixteen({Key? key}) : super(key: key);

  @override
  _TestSixteenState createState() => _TestSixteenState();
}

class _TestSixteenState extends State<TestSixteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单组件"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text("表单演示页面"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormContent()));
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text("CheckBox"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckBoxContent()));
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text("RadioDemo"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RadioDemoContent()));
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text("混合实现"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => blendContent()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FormContent extends StatefulWidget {
  const FormContent({Key? key}) : super(key: key);

  @override
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  late TextEditingController _username;
  var textUsername = "初始值";

  @override
  void initState() {
    super.initState();
    _username = new TextEditingController(text: "初始值12312");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单演示页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "请输入账号", border: OutlineInputBorder() //设置外部边框
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: "多行文本框", border: OutlineInputBorder() //设置外部边框
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true, //设置显示密码框
              decoration: InputDecoration(
                  hintText: "密码框", border: OutlineInputBorder() //设置外部边框
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "用户名",
                  border: OutlineInputBorder(), //设置外部边框
                  labelText: "用户名"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "文本框设置图标",
                icon: Icon(Icons.people),
                border: OutlineInputBorder(), //设置外部边框
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
                  hintText: "获取文本内容",
                  border: OutlineInputBorder(), //设置外部边框
                ),
                controller: _username,
                onChanged: (value) {
                  setState(() {
                    _username.text = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textUsername = _username.text;
                    });
                  },
                  child: Text("获取文本内容")),
            ),
            SizedBox(
              height: 20,
            ),
            Text(textUsername)
          ],
        ),
      ),
    );
  }
}

class CheckBoxContent extends StatefulWidget {
  const CheckBoxContent({Key? key}) : super(key: key);

  @override
  _CheckBoxContentState createState() => _CheckBoxContentState();
}

class _CheckBoxContentState extends State<CheckBoxContent> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox演示页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: flag,
                    onChanged: (value) {
                      setState(() {
                        this.flag = value!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.red),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(this.flag ? "选中" : "未选中")],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              value: flag,
              onChanged: (value) {
                setState(() {
                  this.flag = value!;
                });
              },
              title: Text("选择"),
              subtitle: Text("请选择"),
              secondary: Icon(Icons.home),
            )
          ],
        ),
      ),
    );
  }
}

class RadioDemoContent extends StatefulWidget {
  const RadioDemoContent({Key? key}) : super(key: key);

  @override
  _RadioDemoContentState createState() => _RadioDemoContentState();
}

class _RadioDemoContentState extends State<RadioDemoContent> {
  var _sex;
  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio演示页面"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("Radio"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("男"),
                Radio(
                    value: 1,
                    groupValue: this._sex,
                    onChanged: (value) {
                      setState(() {
                        this._sex = value;
                      });
                    }),
                SizedBox(
                  width: 20,
                ),
                Text("女"),
                Radio(
                    value: 2,
                    groupValue: this._sex,
                    onChanged: (value) {
                      setState(() {
                        this._sex = value;
                      });
                    }),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${this._sex}"),
                Text(this._sex == 1 ? "男" : "女")
              ],
            ),
            Divider(),
            Text("RadioListTile"),
            Divider(),
            RadioListTile(
              value: 1,
              groupValue: this._sex,
              onChanged: (v) {
                setState(() {
                  this._sex = v;
                });
              },
              title: Text("选择1"),
              subtitle: Text("请选择1"),
              secondary: Icon(Icons.home),
            ),
            RadioListTile(
              value: 2,
              groupValue: this._sex,
              onChanged: (v) {
                setState(() {
                  this._sex = v;
                });
              },
              title: Text("选择2"),
              subtitle: Text("请选择2"),
              secondary: Icon(Icons.home),
            ),
            RadioListTile(
              value: 3,
              groupValue: this._sex,
              onChanged: (v) {
                setState(() {
                  this._sex = v;
                });
              },
              title: Text("选择3"),
              subtitle: Text("请选择3"),
              secondary: Icon(Icons.home),
            ),
            Divider(),
            Text("Switch开关"),
            Divider(),
            Switch(
                value: this.flag,
                onChanged: (v) {
                  setState(() {
                    this.flag = v;
                  });
                })
          ],
        ),
      ),
    );
  }
}

class blendContent extends StatefulWidget {
  const blendContent({Key? key}) : super(key: key);

  @override
  _blendContentState createState() => _blendContentState();
}

class _blendContentState extends State<blendContent> {
  late String _username;
  var _sex;
  String data = "";

  List hobby = [
    {"check": true, "titile": "吃饭"},
    {"check": false, "titile": "睡觉"},
    {"check": false, "titile": "打豆豆"},
  ];

  void _setRadioChanged(v) {
    setState(() {
      this._sex = v;
    });
  }

  List<Widget> _gerHobby() {
    List<Widget> list = [];
    for (var i = 0; i < hobby.length; i++) {
      list.add(Text(this.hobby[i]["titile"]+":"));
      list.add(Checkbox(
        value: this.hobby[i]["check"],
        onChanged: (bool? value) {
          setState(() {
            this.hobby[i]["check"] = value;
          });
        },
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("学员信息上报系统"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "请输入用户信息",
                  border: OutlineInputBorder(), //设置外部边框
                  labelText: "用户名"),
              onChanged: (v) {
                setState(() {
                  this._username = v;
                });
              },
            ),
            Row(
              children: [
                Text("男："),
                Radio(
                    value: 1,
                    groupValue: this._sex,
                    onChanged: this._setRadioChanged),
                SizedBox(
                  width: 20,
                ),
                Text("女："),
                Radio(
                    value: 2,
                    groupValue: this._sex,
                    onChanged: this._setRadioChanged),
              ],
            ),
            Column(
              children: [
                Text("爱好："),
                Row(
                  children: _gerHobby(),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    data = "上报成功：姓名：${this._username}  性别：${this._sex} 爱好：${hobby}";
                  });
                },
                child: Text("上报信息"),
              ),
            ),
            Divider(),
            Text(data),
          ],
        ),
      ),
    );
  }
}
