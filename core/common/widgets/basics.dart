import 'package:flutter/material.dart';

mixin CommonWidgets {
  SizedBox verticalSpace({required double height}) {
    return SizedBox(
      height: height,
      width: 0,
    );
  }

  SizedBox horizontalSpace({required double width}) {
    return SizedBox(
      height: 0,
      width: width,
    );
  }

  SizedBox emptyContainer() {
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }
}
