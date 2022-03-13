// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_notebook/core/base/state/base_state.dart';
import 'package:flutter_notebook/core/base/view/base_widget.dart';
import 'package:flutter_notebook/core/extension/string_extension.dart';
import 'package:flutter_notebook/core/init/lang/concrete/easy_localization/locale_keys.g.dart';
import 'package:flutter_notebook/view/test/view_model/counter_view_model.dart';


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends BaseState<Counter> {
  late final CounterViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<CounterViewModel>(
      viewModel: CounterViewModel(),
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.giris.locale),
          ),
          body: SafeArea(
            child: Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn_mtd(
                        "dene buton",
                        Colors.blue,
                        
                      ),
                      btn_mtd(
                        "mimari classları deneme",
                        Colors.deepPurple,
                        dene: () {
                          print("kol back  çalıştı");
                        },
                      ),
                      mobx_exam_container(viewModel: viewModel),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onModelReady: (model) => viewModel = model,
      onDispose: null,
    );
  }

  Container btn_mtd(String title, Color btnColor, {VoidCallback? dene}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: btnColor,
      ),
      child: FlatButton(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: dene ?? dene,
        // onPressed: () {
        //   if(dene!=null) dene;
        //   // AnalyticService.instance?.dene2();

        //   // CacheService.instance.ensureInit();

        //   // INavigationService navigationService = NavigationService.instance;
        //   // NavigationManagerOfCore navigationManagerOfCore = navigationService
        //   //     .getStuffUtilOfNavigationService() as NavigationManagerOfCore;
        //   // navigationService.navigateToPage(AppNavigationPagesEnum.BUY_VIEW,
        //   //     data: "jkljkl",
        //   //     selectedAnimation: AppNavigationAnimationsEnum.SLIDE);
        //   // print("gelen innstance içeriği: " +
        //   //     navigationManagerOfCore.getNavigatorKey().toString());

        //   //  ThemeService.instance;
        //   // .changeTheme(AppThemeTypes.CUSTOM_THEME_DARK);
        // },
      ),
    );
  }
}

class mobx_exam_container extends StatelessWidget {
  const mobx_exam_container({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final CounterViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.red,
      ),
      //  height: dynamicHeight(0.8),
      child: Column(
        children: [
          Observer(builder: (_) {
            return Text("anlık değer : " + viewModel.value.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 25));
          }),
          TextButton(
              onPressed: () {
                viewModel.increament();
              },
              child: const Text(
                "arttır",
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
          TextButton(
              onPressed: () {
                viewModel.descreament();
              },
              child: const Text(
                "azalt",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
        ],
      ),
    );
  }
}
