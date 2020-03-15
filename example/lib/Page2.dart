/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */
import 'package:flutter/material.dart';
import 'package:tix_navigate/tix_navigate.dart';

class Page2 extends StatefulWidget with BaseRoute {
  @override
  _Page2State createState() => _Page2State();

  @override
  String buildPath() => '/page2';

  @override
  Route routeTo(data) => MaterialPageRoute(builder: (context) => Page2());
}

class _Page2State extends State<Page2> with TixNavigateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('asdfasd'),
        ),
      ),
    );
  }
}
