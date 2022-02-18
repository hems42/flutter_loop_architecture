import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_notebook/core/base/state/base_state.dart';
import 'package:flutter_notebook/core/base/view/base_widget.dart';
import 'package:flutter_notebook/core/extension/string_extension.dart';
import 'package:flutter_notebook/core/init/lang/concrete/easy_localization/language_manager_easy_localization.dart';
import 'package:flutter_notebook/core/init/lang/concrete/easy_localization/locale_keys.g.dart';
import 'package:flutter_notebook/core/init/lang/concrete/language_service.dart';
import 'package:flutter_notebook/core/init/theme/concrete/theme_service.dart';
import 'package:flutter_notebook/view/test/view_model/counter_view_model.dart';

import '../../../core/init/theme/concrete/theme_service.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //  height: dynamicHeight(0.2),
                      color: const Color.fromARGB(255, 224, 65, 17),

                      child: FlatButton(
                        child: const Text("tıkıla"),
                        onPressed: () {
                          // AnalyticService.instance?.dene2();

                          // CacheService.instance.ensureInit();

                          

                          

                          ThemeService.instance;
                          // .changeTheme(AppThemeTypes.CUSTOM_THEME_DARK);
                        },
                      ),
                    ),
                    Container(
                      color: Colors.blueAccent,
                      //  height: dynamicHeight(0.8),
                      child: Column(
                        children: [
                          Observer(builder: (_) {
                            return Text(
                                "anlık değer : " + viewModel.value.toString());
                          }),
                          TextButton(
                              onPressed: () {
                                viewModel.increament();
                              },
                              child: const Text(
                                "arttır",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              )),
                          TextButton(
                              onPressed: () {
                                viewModel.descreament();
                              },
                              child: const Text(
                                "azalt",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                  ],
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
}
