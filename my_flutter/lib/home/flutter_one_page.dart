import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';

class FlutterOnePage extends StatelessWidget {
  final String data;
  const FlutterOnePage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            // BoostNavigator.instance.pop();
            Navigator.pop(context);
          },
        ),
        middle: Text('FlutterBoost-OnePage'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Text("我是FlutterOne界面，接受传值的数据：${data.toString()}"),
      ),
    );
  }
}
