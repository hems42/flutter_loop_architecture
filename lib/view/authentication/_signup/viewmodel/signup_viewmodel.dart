// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import '../service/concrete/signup_network_service.dart';
import '../model/signup_request_model.dart';
import '../service/abstract/ife_signup_network_service.dart';
import '../../../../core/base/model/abstract/ife_base_view_model.dart';
import '../service/abstract/ife_singup_cache_service.dart';
import 'package:mobx/mobx.dart';
import '../service/concrete/signup_cache_service.dart';

part 'signup_viewmodel.g.dart';

class SingupViewModel = _SingupViewModelBase with _$SingupViewModel;

abstract class _SingupViewModelBase with Store, IBaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  late final ISignupCacheService _signupCacheService;
  late final ISignupNetworkService _signupNetworkService;

  late BuildContext context;

  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    _signupCacheService = SingupCacheService();
    _signupNetworkService = SignupNetworkService();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  Future<void> signup() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await _signupNetworkService.signup(SignupRequestModel(
          eMail: emailController!.text,
          userNickName: usernameController!.text,
          password: passwordController!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          scaffoldState.currentState!
              .showSnackBar(SnackBar(content: Text(response.refreshToken!)));
        }
        await _signupCacheService.saveAccesToken(
            response.accessToken.toString(),
            email: response.email);

        await _signupCacheService.saveRefreshToken(
            response.refreshToken.toString(),
            email: response.email);
      }
    }
    isLoadingChange();
  }
}
