//
// Created by 杨建 on 2021/8/19.
// Copyright (c) 2021 WMai All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterH5Page extends StatefulWidget {
  final String h5Url = "http://47.111.250.227/";
  // final String h5Url = "https://www.baidu.com";

  @override
  _FlutterH5PageState createState() => _FlutterH5PageState();
}

class _FlutterH5PageState extends State<FlutterH5Page> {
  // 是否显示加载动画
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter写的H5'),
      ),
      body: Column(
        children: [
          this._flag ? _getMoreWidget() : Text(""),
          Expanded(
              child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.h5Url)),
            // 加载进度变化事件
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              if ((progress / 100) > 0.999) {
                setState(() {
                  this._flag = false;
                });
              }
            },
          ))
        ],
      ),
    );
  }

  // 加载状态
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
