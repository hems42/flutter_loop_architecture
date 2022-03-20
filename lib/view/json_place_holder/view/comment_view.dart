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
  late Future<List<CommentModel>> model;

  @override
  void initState() {
    model = getCommentModelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentViewModel>(
      onModelReady: (model) {
        viewModel = model;
        viewModel.init();
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Servis Geliştirmesi"),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(flex: 5, child: list_items()),
                Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.grey,
                      child: SingleChildScrollView(
                          child: Center(
                        child: Column(
                          children: [
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                            btn_request("GET", Colors.red, () {}),
                          ],
                        ),
                      )),
                    ))
              ],
            ),
          ),
        );
      },
      viewModel: CommentViewModel(),
      onDispose: () {},
    );
  }

  Widget list_items() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.amber.shade200,
      child: FutureBuilder<List<CommentModel>>(
        initialData: [CommentModel(body: "body", email: "email", name: "name")],
        future: model,
        builder: (context, snapshot) {
          final comments = snapshot.data;
          if (snapshot.hasError) {
            print("hataya düşüt : " + snapshot.error.toString());
            return const Center(child: Text("bura yarrağı yedi"));
          } else if (snapshot.hasData) {
            return buildCommentList(comments ??
                List<CommentModel>.of([
                  CommentModel(body: "body", email: "email", name: "name")
                ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<CommentModel>> getCommentModelList() async {
    late List<CommentModel> model;
    await NetworkService.instance
        .fetch<List<CommentModel>, CommentModel>(
            "https://jsonplaceholder.typicode.com/comments",
            type: HttpRequestTypes.GET,
            parseModel: CommentModel())
        .then((value) => model = value.data as List<CommentModel>);

    return model;
  }

  Widget buildCommentList(List<CommentModel> commentsAll) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: commentsAll.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemBuilder: (c, i) {
        final comment = commentsAll.elementAt(i);

        return Container(
          margin: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(5),
            // collapsedBackgroundColor: Colors.blue,
            //collapsedIconColor: Colors.white,
            textColor: const Color.fromRGBO(255, 255, 255, 1),
            children: [
              Text(comment.name.toString()),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "apply",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
            backgroundColor: Colors.blueGrey,
            iconColor: Colors.white,
            leading: const Icon(Icons.email_sharp),
            title: Text("$i  : " + comment.email.toString()),
          ),
        );
      },
    );
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
}
