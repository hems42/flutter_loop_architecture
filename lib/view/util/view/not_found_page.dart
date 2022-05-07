import 'package:flutter/material.dart';

class NotFoundPageView extends StatelessWidget {
  const NotFoundPageView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey,
            child: Text(
              "NOT FOUND PAGE!!!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 140,
                
        
              ),
            ) ),
        ),
      ),
      
    );
  }
}