import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TestSeventeen extends StatefulWidget {
  const TestSeventeen({Key? key}) : super(key: key);

  @override
  _TestSeventeenState createState() => _TestSeventeenState();
}

class _TestSeventeenState extends State<TestSeventeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期组件"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("系统日期"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SystemDataContent()));
            },
          ),
          ListTile(
            title: Text("三方日期"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OtherDataContent()));
            },
          )
        ],
      ),
    );
  }
}

class SystemDataContent extends StatefulWidget {
  const SystemDataContent({Key? key}) : super(key: key);

  @override
  _SystemDataContentState createState() => _SystemDataContentState();
}

class _SystemDataContentState extends State<SystemDataContent> {
  var _now = new DateTime.now();
  var _nowTime = TimeOfDay.fromDateTime(new DateTime.now());

  _showDataPicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: _now,
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
      locale: Locale('zh'),
    );

    setState(() {
      this._now = result!;
    });
  }

  _showTimePicker() async {
    var result = await showTimePicker(
      context: context,
      initialTime: _nowTime,
    );

    setState(() {
      this._nowTime = result!;
    });
  }

  @override
  void initState() {
    super.initState();

    print(_now);
    print(_now.microsecondsSinceEpoch); //转换成时间戳  1627454464973662
    print(DateTime.fromMillisecondsSinceEpoch(1627454464973662)); //时间戳转时间
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统日期"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //给组件设置点击事件
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${this._now}"),
                  Icon(Icons.all_inclusive_sharp)
                ],
              ),
              onTap: () {
                _showDataPicker();
              },
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${formatDate(this._now, [yyyy, "年", mm, "月", dd])}"),
                  Icon(Icons.all_inclusive_sharp)
                ],
              ),
              onTap: () {
                _showDataPicker();
              },
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${this._nowTime.format(context)}"),
                  Icon(Icons.timelapse)
                ],
              ),
              onTap: () {
                _showTimePicker();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OtherDataContent extends StatefulWidget {
  const OtherDataContent({Key? key}) : super(key: key);

  @override
  _OtherDataContentState createState() => _OtherDataContentState();
}

class _OtherDataContentState extends State<OtherDataContent> {

  DateTime _nowDate = new DateTime.now();
  TimeOfDay _nowTime = TimeOfDay.fromDateTime(new DateTime.now());

  _showDataPicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2015, 3, 5),
        maxTime: DateTime(2025, 6, 7), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        this._nowDate = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  _showDataTimePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(2015, 3, 5),
        maxTime: DateTime(2025, 6, 7), onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          setState(() {
            this._nowDate = date;
          });
        }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  _showTimePicker() {
    DatePicker.showTimePicker(context,
        showTitleActions: true,
        onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          setState(() {
            this._nowTime = date as TimeOfDay;
          });
        }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("三方日期组件flutter_datetime_picker"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("${formatDate(this._nowDate, [yyyy, "-", mm, "-", dd])}"), Icon(Icons.arrow_drop_down)],
                ),
                onTap: _showDataPicker,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("${this._nowTime.format(context)}"), Icon(Icons.arrow_drop_down)],
                ),
                onTap: _showTimePicker,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("${formatDate(this._nowDate, [yyyy, '-', mm, '-', dd," ",HH, ':', nn, ':', ss])}"), Icon(Icons.arrow_drop_down)],
                ),
                onTap: _showDataTimePicker,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
