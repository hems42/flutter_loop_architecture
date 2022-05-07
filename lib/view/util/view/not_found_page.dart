import 'package:flutter/material.dart';

import '../../../core/base/state/abstract/ife_base_state.dart';


class NotFoundPageView extends StatefulWidget {
  const NotFoundPageView({ Key? key }) : super(key: key);

  @override
  State<NotFoundPageView> createState() => _NotFoundPageViewState();
}

class _NotFoundPageViewState extends BaseState<NotFoundPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Upppps... Can not find your page!!!"),
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            flex: 1,
            child: Container(
                color: Colors.green,
                child: Text(
                  "NOT FOUND PAGE!!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: dynamicHeight(0.2),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
