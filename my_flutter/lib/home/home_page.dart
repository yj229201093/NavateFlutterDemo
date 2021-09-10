import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/home/flutter_h5_page.dart';
import 'package:my_flutter/home/flutter_one_page.dart';
import 'package:my_flutter/home/other_h5_page.dart';

class HomePage extends StatefulWidget {
  final String data;
  const HomePage({Key key, this.data}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final btnString = [
      'FlutterPushNativePage',
      'FlutterPushFlutterPage',
      'FlutterPopNativePage',
      'FlutterPushFlutterH5Page',
      'FlutterPushOtherH5Page',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {},
        ),
        middle: Text('FlutterBoost'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("原生过来的数据111：${widget.data}"),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
          ),
          Expanded(
              child: ListView(
            children: List.generate(btnString.length, (index) {
              return GestureDetector(
                onTap: () {
                  pushToPageHandle(index);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  padding: const EdgeInsets.only(top: 0, left: 15),
                  color: Colors.white,
                  child: Text(
                    btnString[index],
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }

  void showTipIfNeeded(String value) {
    if (value == null || value == 'null' || value.isEmpty) {
      return;
    }
    print("原生回来的value = ${value.toString()}");
  }

  void pushToPageHandle(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FlutterOnePage(
            data: '你好，WMaiFlutter',
          );
        }));
        break;
      case 2:
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FlutterH5Page();
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OtherH5Page();
        }));
        break;
    }
  }
}
