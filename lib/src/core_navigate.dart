/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:flutter/material.dart';
import 'package:tix_navigate/src/tix_route.dart';
import 'package:tix_navigate/src/core_route.dart';
import 'package:tix_navigate/src/exception.dart';

class TixNavigate {
  static TixNavigate get instance => TixNavigate();
  factory TixNavigate() => _singleton;
  static final TixNavigate _singleton = TixNavigate._init();

  GlobalKey<NavigatorState> navigatorKey;
  CoreRouter coreRouter = CoreRouter();

  TixNavigate._init();

  void addObserveRoute(Function(String) onRouteChange) {
    if (onRouteChange != null) {
      coreRouter.onRoute = onRouteChange;
    }
  }

  void configRoute(List<TixRoute> configRoutes, {GlobalKey<NavigatorState> key}) {
    if (key == null) {
      navigatorKey = GlobalKey<NavigatorState>();
    } else {
      navigatorKey = key;
    }
    if (configRoutes != null && coreRouter != null) {
      coreRouter.routes.clear();
      coreRouter.routes.addAll(configRoutes);
    }
  }

  void configNavigatorKey({GlobalKey<NavigatorState> key}) {
    if (key == null) {
      navigatorKey = GlobalKey<NavigatorState>();
    } else {
      navigatorKey = key;
    }
  }

  Route<dynamic> generator(RouteSettings routeSettings) => coreRouter.generator(routeSettings);

  pop({Object data}) => navigatorKey.currentState.pop(data);

  Future<dynamic> navigateTo(TixRoute route, {Object data, bool clearStack}) async {
    if (coreRouter != null) {
      await checkRoute(route);
      final routeMatch = coreRouter.routes
          .firstWhere((r) => r.buildPath().contains(route.buildPath()), orElse: () => null);
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

  Future<bool> checkRoute(TixRoute route) {
    final routeMatch = coreRouter.routes
        .firstWhere((r) => r.buildPath().contains(route.buildPath()), orElse: () => null);
    if (routeMatch == null) {
      debugPrint('add ' + route.buildPath() + ' because routeMatch = null');
      coreRouter.routes.add(route);
    }
    debugPrint('size routes ${coreRouter.routes.length}');

    return Future.value();
  }
}
