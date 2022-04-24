// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/signup_request_model.dart';
import '../service/abstract/ife_signup_network_service.dart';
import '../../../../core/base/model/abstract/ife_base_view_model.dart';
import '../service/abstract/ife_singup_cache_service.dart';
import 'package:mobx/mobx.dart';

part 'signup_viewmodel.g.dart';

class SingupViewModel = _SingupViewModelBase with _$SingupViewModel;

abstract class _SingupViewModelBase with Store, IBaseViewModel {
  final ISignupCacheService _cacheService;
  final ISignupNetworkService _signupService;
  late BuildContext context;

  _SingupViewModelBase(this._cacheService, this._signupService);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    // TODO: implement init
  }

  void singup(SignupRequestModel signupRequestModel) {
    _signupService.signup(signupRequestModel);
  }
}
