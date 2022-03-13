import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../service/json_place_holder_service.dart';
part 'comment_view_model.g.dart';

class CommentViewModel = _CommentViewModelBase with _$CommentViewModel;

abstract class _CommentViewModelBase with Store, IBaseViewModel {
  late BuildContext context;
  late JsonPlaceHolderService service;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {service = JsonPlaceHolderService();}

  

  @observable
  int i = 0;
}
