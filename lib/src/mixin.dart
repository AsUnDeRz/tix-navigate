/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

import 'package:tix_navigate/tix_navigate.dart';

abstract class TixNavigateProvider {
  bool pop({Object data});
  Future<dynamic> navigateTo(TixRoute route, {Object data, bool clearStack});
}

mixin TixNavigateMixin implements TixNavigateProvider {
  @override
  bool pop({Object? data}) {
    return TixNavigate.instance.pop(data: data);
  }

  @override
  Future navigateTo(TixRoute route, {Object? data, bool? clearStack}) {
    return TixNavigate.instance.navigateTo(route, data: data, clearStack: clearStack);
  }
}
