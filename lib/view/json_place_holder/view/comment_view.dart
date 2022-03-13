import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/state/base_state.dart';
import 'package:flutter_notebook/core/base/view/base_widget.dart';
import 'package:flutter_notebook/view/json_place_holder/viewmodel/comment_view_model.dart';

class CommentListView extends StatefulWidget {
  const CommentListView({Key? key}) : super(key: key);

  @override
  State<CommentListView> createState() => _CommentListViewState();
}

class _CommentListViewState extends BaseState<CommentListView> {
  late final CommentViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<CommentViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) {
        return Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              btn_request("GET", Colors.green, () {
                viewModel.service.getAllComments()!.then((value) { print(value!.email.toString());});
              }),
              btn_request("POST", Colors.red, () {
                print("kırmızya tıkılandı");
              }),
              btn_request("FETCH", Colors.blue, () {
                print("maviye tıkılandı");
              }),
              btn_request("PUT", Colors.amber, () {}),
            ],
          ),
        ));
      },
      viewModel: CommentViewModel(),
      onDispose: () {},
    );
  }
}

Container btn_request(
    String requestType, Color buttonColor, Function buttonFunction) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3.0),
    child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white30),
            fixedSize: MaterialStateProperty.all(const Size(250, 30)),
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(buttonColor)),
        onPressed: () {
          buttonFunction.call();
        },
        child: Text(
          requestType,
          style: const TextStyle(color: Colors.white),
        )),
  );
}
