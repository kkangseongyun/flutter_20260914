import 'package:flutter/material.dart';


class DetailNewsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailNewsWidgetState();
  }
}

class DetailNewsWidgetState extends State<DetailNewsWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('News'),
    );
  }
}