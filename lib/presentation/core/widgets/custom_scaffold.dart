import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget body;
  final Widget? floatingActionButton;
  final bool isScrolling;
  final Widget? appBarTitle;
  final BottomNavigationBar? bottomNavigationBar;
  final bool useAppBar;
  final List<Widget> actions;
  final Drawer? drawer;
  final bool hasBackButton;
  final double? titleSpacing;
  const CustomScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.padding,
    this.useAppBar = true,
    this.bottomNavigationBar,
    this.actions = const [],
    this.isScrolling = false,
    this.hasBackButton=true,
    this.appBarTitle,
    this.titleSpacing,
    this.drawer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer:  drawer,
        body: isScrolling
            ? SingleChildScrollView(
                child: body,
              )
            : body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
