import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class  SimpleAppBar extends StatefulWidget {
  final String title;
  const SimpleAppBar({super.key,this.title=""});

  @override
  State<StatefulWidget> createState() => SimpleAppBarState();

}

class SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: AutoSizeText(
        widget.title??"",
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),
      ),
      centerTitle: true,
      pinned: true,
      elevation: 0.3,
    );
  }

}