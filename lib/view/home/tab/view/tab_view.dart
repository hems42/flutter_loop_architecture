import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/state/abstract/ife_base_state.dart';

class TabView extends StatefulWidget {
  const TabView({ Key? key }) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends BaseState<TabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Tab Page"),
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(child: Center(
        child: Container(
          child: Text("TAB PAGE", style: TextStyle(
            color: Colors.red,
            fontSize: dynamicHeight(0.2)
          
          ),),
        ),
      )),
    );
  }
}