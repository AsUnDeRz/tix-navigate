/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:flutter/material.dart';
import 'package:tix_navigate/src/base_route.dart';

class CoreRouter {
  final List<BaseRoute> routes = [];

  Route<dynamic> generator(RouteSettings settings) {
    final routeMatch = routes.firstWhere((r) => r.buildPath() == settings.name);
    return routeMatch.routeTo(settings.arguments);
  }
}
