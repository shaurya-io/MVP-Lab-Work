// Created by Priyanshu Mishra

import 'dart:async';

import 'package:news_app_api/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Veritas",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: LCRAppBar(),
          body: SlidingUpPanel(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            minHeight: 90,
            maxHeight: 300,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            panel:
                // Center( child:
                Column(
              children: <Widget>[
                Container(
                    height: 50,
                    // width: 200,
                    color: Colors.blue[100],
                    child: Center(
                        child: Text(
                      "Article",
                      style: TextStyle(fontSize: 20),
                    ))),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment(-1.0, -1.0),
                  // color: Colors.red,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tincidunt arcu non purus pulvinar, a gravida nibh faucibus. Vivamus rutrum ultricies mollis. Praesent eget malesuada ligula. Cras vel urna ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse in vestibulum ipsum. Vivamus eget tincidunt.",
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),

            // ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: widget.postUrl,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
          ),
        ));
  }
}
