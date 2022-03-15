import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/init/network/concrete/network_service.dart';
import 'package:flutter_notebook/view/json_place_holder/model/comment_model.dart';
import '../../../core/constants/enum/http_request_types_enum.dart';
import '../../../core/init/network/concrete/dio/network_manager_dio.dart';
import '../model/post_model.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_widget.dart';
import '../viewmodel/comment_view_model.dart';

class CommentListView extends StatefulWidget {
  const CommentListView({Key? key}) : super(key: key);

  @override
  State<CommentListView> createState() => _CommentListViewState();
}

class _CommentListViewState extends BaseState<CommentListView> {
  late CommentViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<CommentViewModel>(
      onModelReady: (model) {
        viewModel = model;
        viewModel.init();
      },
      onPageBuilder: (context, value) {
        return SafeArea(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.green.shade100,
                child: Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          btn_request("GET", Colors.green, () {
                            List<PostModel>? models = null;
                            print("başladı");
                            try {
                              final gelen = NetworkService.instance!
                                  .fetch<List<PostModel>, PostModel>(
                                      "https://jsonplaceholder.typicode.com/posts",
                                      type: HttpRequestTypes.GET,
                                      parseModel: PostModel())
                                  .then((value) {
                                models = (value.data as List<PostModel>);

                                models!.forEach((element) {
                                  print(element.title);
                                });
                              }).whenComplete(() => print("sonunda bitti"));
                            } catch (e) {
                              print("gelen hata : " + e.toString());
                            }
                            print("bitti");
                          }),
                          btn_request(
                              "GET2", const Color.fromARGB(255, 124, 31, 25),
                              () async {
                            await (viewModel.commentModels
                                    as Future<List<CommentModel>>)
                                .then((value) => value.forEach((element) {
                                      print(element.name);
                                    }));
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //list_items()
              //list_future_builder()
            ],
          )),
        );
      },
      viewModel: CommentViewModel(),
      onDispose: () {},
    );
  }

  Expanded list_items() {
    return Expanded(
      flex: 5,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              10,
              (index) => Material(
                  child: ExpansionTile(title: Text(index.toString())))),
        ),
      ),
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
