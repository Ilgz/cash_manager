 import 'package:flutter/material.dart';

void showCustomModalBottomSheet(BuildContext context, Widget child) {
showModalBottomSheet(
context: context,
isDismissible: false,
shape: const RoundedRectangleBorder(
borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
isScrollControlled: true,
builder: (BuildContext context) => child,
);
}