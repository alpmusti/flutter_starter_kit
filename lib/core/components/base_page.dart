import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasePage extends StatelessWidget {
  final String titleKey;
  final Widget child;
  final Color? backgroundColor;
  final Widget? bottomBar;
  final bool isCentered;
  final bool hasScroll;
  final Widget? rightIcons;
  final bool enableFullscreen;
  BasePage({
    Key? key,
    required this.child,
    required this.titleKey,
    this.bottomBar,
    this.backgroundColor = Colors.white,
    this.isCentered = false,
    this.hasScroll = true,
    this.enableFullscreen = false,
    this.rightIcons,
  }) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: backgroundColor,
      appBar: enableFullscreen
          ? null
          : AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(titleKey.tr),
            ),
      body: buildBody(context),
      bottomNavigationBar: bottomBar,
    );
  }

  Widget buildBody(context) {
    return SafeArea(
      child: hasScroll ? buildScroll(context) : buildWithoutScroll(context),
    );
  }

  Widget buildScroll(BuildContext context) {
    final mq = MediaQueryData.fromWindow(window);
    final widget = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          child: SizedBox(
            child: child,
            height: double.infinity,
          ),
          constraints: BoxConstraints.tightFor(
            height: mq.size.height,
          ),
        ),
      ),
    );
    if (isCentered) {
      return Center(child: widget);
    }
    return widget;
  }

  Widget buildWithoutScroll(BuildContext context) {
    final widget = GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: child);
    if (isCentered) {
      return Center(child: widget);
    }
    return widget;
  }
}
