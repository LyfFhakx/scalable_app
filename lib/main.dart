import 'package:flutter/material.dart';
import 'package:scalable_ddd_app/core/locators/locator.dart';
import 'package:scalable_ddd_app/ui.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'domain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorInitialization();
  await getIt<SharedPrefsService>().configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
        ChangeNotifierProvider(create: (_) => User(id: 'id', name: 'name')),
        ChangeNotifierProvider(create: (_) => ArticleListProvider()),
      ],
      child: Selector<AppSettingsProvider,ThemeSettings>(
        selector: (_,settings)=>settings.themeSettings,
        builder: (_,themeSettings,__) {
          final appTheme = AppTheme(seedColor:themeSettings.appColor.color);
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: appTheme.getTheme(Brightness.light),
            darkTheme: appTheme.getTheme(Brightness.dark),
            themeMode: themeSettings.appThemeMode.themeMode,
            routerConfig: AppRouter.simpleRouter,
          );
        }
      ),
    );
  }
}
