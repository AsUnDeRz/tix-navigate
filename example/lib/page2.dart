/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tix_navigate/tix_navigate.dart';

class PageMultiple extends StatefulWidget with TixRoute {
  final String? data;

  const PageMultiple({Key? key, this.data}) : super(key: key);
  @override
  _PageMultipleState createState() => _PageMultipleState();

  @override
  Route routeTo(data) {
    return CupertinoPageRoute(
        builder: (_) => PageMultiple(
              data: '$data',
            ));
    return MaterialPageRoute(
        builder: (context) => PageMultiple(
              data: "$data",
            ));
  }
}

class _PageMultipleState extends State<PageMultiple> with TixNavigateMixin {
  @override
  void initState() {
    // TODO: implement initState
    print('initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.data ?? ''),
        ),
      ),
    );
  }
}
