import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'view/authentication/_signup/view/concrete/signup_view.dart';
import 'core/constant/static/app/application_statics.dart';
import 'core/init/navigation/abstract/ife_navigation_service.dart';
import 'core/init/navigation/concrete/core_navigation/navigation_manager_core.dart';
import 'core/init/navigation/concrete/navigation_service.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: ApplicationConstants.LANG_ASSET_PATH,
      supportedLocales: const [Locale("en", "US")],
      startLocale: const Locale("en", "US"),
      assetLoader: JsonAssetLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final INavigationService navigationService = NavigationService.instance;
    NavigationManagerOfCore navigationManagerOfCore = navigationService
        .getStuffUtilOfNavigationService() as NavigationManagerOfCore;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: NavigationManagerOfCore.instance.generateRoute,
      navigatorKey: navigationManagerOfCore.navigatorKey,
      
      home: SignupView(),
    );
  }
}
