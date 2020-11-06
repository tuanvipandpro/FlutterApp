import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  ListViewState createState() => ListViewState();
}

class ListViewState extends State<ListViewDemo> {
  // var size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.teal,
                height: 100,
              ),
              Container(
                color: Colors.green,
                height: 100,
              ),
              Container(
                color: Colors.red,
                height: 500,
              ),
              Container(
                color: Colors.yellow,
                height: 50,
              ),

            ],
          ),
        )
      ),
    );
  }
}
