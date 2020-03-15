/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:flutter/material.dart';
import 'package:tix_navigate/src/base_route.dart';
import 'package:tix_navigate/src/core_route.dart';
import 'package:tix_navigate/src/exception.dart';

class TixNavigate {
  static TixNavigate get instance => TixNavigate();
  factory TixNavigate() => _singleton;
  static final TixNavigate _singleton = TixNavigate._init();

  GlobalKey<NavigatorState> navigatorKey;
  CoreRouter coreRouter = CoreRouter();

  TixNavigate._init();

  void configuration(List<BaseRoute> configRoutes, {GlobalKey<NavigatorState> key}) {
    assert(() {
      if (key == null) {
        navigatorKey = GlobalKey<NavigatorState>();
      } else {
        navigatorKey = key;
      }
      return true;
    }());
    assert(() {
      if (configRoutes != null && coreRouter != null) {
        coreRouter.routes.clear();
        coreRouter.routes.addAll(configRoutes);
      } else {
        throw TixNavigateException('config routes is empty and coreRouter == null please init '
            'instance core navigate ');
      }
      return true;
    }());
  }

  Route<dynamic> generator(RouteSettings routeSettings) => coreRouter.generator(routeSettings);

  pop({Object data}) => navigatorKey.currentState.pop(data);

  Future<dynamic> navigateTo(BaseRoute route, {Object data, bool clearStack}) async {
    assert(coreRouter.routes.isNotEmpty);
    assert(navigatorKey != null);
    if (coreRouter != null) {
      final routeMatch = coreRouter.routes.firstWhere((r) => r.buildPath() == route.buildPath());
      if (routeMatch != null) {
        final hasPermission = await routeMatch.hasPermission(data);
        if (hasPermission) {
          if (clearStack ?? routeMatch.clearStack()) {
            return await navigatorKey.currentState
                .pushNamedAndRemoveUntil(route.buildPath(), (check) => false, arguments: data);
          } else {
            return await navigatorKey.currentState.pushNamed(route.buildPath(), arguments: data);
          }
        }
      }
    } else {
      throw TixNavigateException('config routes is empty and coreRouter == null please init '
          'instance core navigate ');
    }
  }
}
