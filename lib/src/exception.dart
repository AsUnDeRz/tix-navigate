/*
 * Copyright (c) 2020. Tix navigate Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 *
 */

class TixNavigateException with Exception {
  String name;

  TixNavigateException(this.name);

  @override
  String toString() {
    return name ?? 'TixNavigateException';
  }
}
