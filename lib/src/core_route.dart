/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:flutter/material.dart';
import 'package:tix_navigate/src/tix_route.dart';

class CoreRouter {
  final List<TixRoute> routes = [];
  Function(String) onRoute;

  Route<dynamic> generator(RouteSettings settings) {
    final routeMatch = routes.firstWhere((r) => r.buildPath() == settings.name);
    if (onRoute != null) {
      onRoute(routeMatch.buildPath());
    }
    return routeMatch.routeTo(settings.arguments);
  }
}
