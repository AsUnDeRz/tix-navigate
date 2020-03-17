/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:flutter/material.dart';

mixin TixRoute {
  String buildPath();
  bool clearStack() => false;
  Future<bool> hasPermission(dynamic params) async => true;
  Route<dynamic> routeTo(dynamic data);
}
