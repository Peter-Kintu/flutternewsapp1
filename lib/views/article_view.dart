import "dart:async";

import "package:flutter/material.dart";
// ignore: unnecessary_import
import "package:flutter/widgets.dart";
// ignore: unused_import
import "package:webview_flutter_web/webview_flutter_web.dart";

class ArticleView extends StatefulWidget {
  

  final String blogUrl;
  // ignore: use_key_in_widget_constructors
  const ArticleView({required this.blogUrl});

  @override
  // ignore: library_private_types_in_public_api
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  // ignore: unused_field
  final Completer<WebViewController> _completer = 
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Agokya"),
            Text("News", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16)
              ,child: const Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
        }),
      ),
    ),
    );
  }
}

class WebViewController {
}

// ignore: non_constant_identifier_names
WebView({required String initialUrl, required onWebViewCreated}) {
}
