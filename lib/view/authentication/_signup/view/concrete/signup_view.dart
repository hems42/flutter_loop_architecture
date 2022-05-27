// ignore_for_file: deprecated_member_use, unused_local_variable

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_notebook/core/extension/context_extension.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';
import 'package:flutter_notebook/core/init/network/concrete/network_service.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/home_model.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/home_model.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/signup_response_model.dart';
import '../../../../../core/constant/enum/navigation/navigation_animations_enum.dart';
import '../../../../../core/constant/enum/navigation/navigation_pages_enum.dart';
import '../../../../../core/constant/enum/network/http_request_types_enum.dart';
import '../../../../../core/constant/static/app/application_statics.dart';
import '../../../../../core/init/cache/concrete/hive/cache_manager_hive.dart';
import '../../../../../core/init/navigation/concrete/navigation_service.dart';
import '../../../../../core/base/view/concrete/base_widget.dart';
import '../../../../../core/extension/string_extension.dart';
import '../../model/home_model.dart';
import '../../model/signup_request_model.dart';
import '../../service/concrete/signup_cache_service.dart';
import '../../service/concrete/signup_network_service.dart';
import '../../viewmodel/signup_viewmodel.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SingupViewModel>(
      viewModel: SingupViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SingupViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Observer(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Kayıt Sayfası"),
            ),
            key: value.scaffoldState,
            body: SafeArea(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: buildForm(value, context),
              )),
            ),
          );
        }),
      ),
    );
  }

  Form buildForm(SingupViewModel value, BuildContext context) {
    String result = value.isLoading == false
        ? "henüz kayıt edilmedi"
        : "kayıt başarıyla gerçekleşti";
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldUsername(context, value),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          Spacer(),
          Text("Kayt olma durumu :  $result"),
          Spacer(),
          FlatButton(
              onPressed: () async {
                var response = await value.signup();
                print("gelen reponse access token :" +
                    response.accessToken.toString());
                print("gelen reponse refresh token :" +
                    response.refreshToken.toString());
              },
              child: Text("signup", style: TextStyle(color: Colors.white)),
              color: Colors.red),
          // buildTextForgot(),
          Spacer(flex: 6),
          FlatButton(
              onPressed: () {
                NavigationService.instance.navigateToPage(
                    NavigationPagesEnum.LOGIN,
                    data: null,
                    selectedAnimation: NavigationAnimationsEnum.FADE);
              },
              child: Text("Not Found!!!")),
          SizedBox(height: 20),
          FlatButton(
              onPressed: () async {
                var networkService = NetworkService.instance;
                var cacheService = CacheService.instance;
              
                var accessToken =
                    await cacheService.getAccessToken(checkEmail: (email) {
                  print("gelen email : " + email.toString());
                });

                var refreshToken =
                    await cacheService.getRefreshToken(checkEmail: (email) {
                  print("gelen email : " + email.toString());
                });

                print("acces token : " + accessToken.toString());
                print("refresh token : " + refreshToken.toString());

                var homeModel = await networkService
                    .fetch<HomeModel, HomeModel>(ApplicationConstants.DENE_HOME,
                        type: HttpRequestTypesEnum.GET,
                        parseModel: HomeModel());

                print("gelen home modeli : " + (homeModel.data as HomeModel).toString());
              },
              child: Text("dene", style: TextStyle(
              
              ),)),
          //  buildRaisedButtonLogin(context, value),
          // buildWrapForgot(),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(
      BuildContext context, SingupViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelText: "password",
            icon: Icon(Icons.password_sharp),
            suffixIcon: FlatButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                child: Observer(builder: (_) {
                  return Icon(
                      viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                }))),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(
      BuildContext context, SingupViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: "email",
        icon: Icon(Icons.email),
      ),
    );
  }

  TextFormField buildTextFormFieldUsername(
      BuildContext context, SingupViewModel viewModel) {
    return TextFormField(
      controller: viewModel.usernameController,
      validator: (value) => value!.isValidEmails ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: "username",
        icon: Icon(Icons.verified_user_outlined),
      ),
    );
  }

/*
  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        duration: context.lowDuration,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: Colors.white,
        child: Center(child: Image.asset(ImageConstants.instance.hotDog)));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        labelStyle: context.textTheme.headline5,
        unselectedLabelStyle: context.textTheme.headline5,
        labelColor: Colors.black,
        indicatorColor: Colors.yellow,
        indicatorWeight: 5,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(text: '   ${LocaleKeys.login_tab1.tr()}   '),
          Tab(text: LocaleKeys.login_tab2.tr()),
        ]);
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildRaisedButtonLogin(context, value),
          buildWrapForgot(),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelStyle: context.textTheme.subtitle1,
            labelText: LocaleKeys.login_password.tr(),
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: FlatButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                child: Observer(builder: (_) {
                  return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                }))),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryVariant),
    );
  }

  Widget buildTextForgot() => Align(alignment: Alignment.centerRight, child: Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end).tr());

  Widget buildRaisedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return RaisedButton(
        padding: context.paddingNormal,
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginSevice();
              },
        shape: StadiumBorder(),
        child: Center(child: Text(LocaleKeys.login_login.tr(), style: context.textTheme.headline5)),
        color: context.colors.onError,
      );
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [Text(LocaleKeys.login_dontAccount.tr()), FlatButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.tr()))],
    );
  }

*/
}
