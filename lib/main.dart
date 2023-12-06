import 'package:flutter/material.dart';
import 'package:scalable_ddd_app/core/locators/locator.dart';
import 'package:scalable_ddd_app/ui.dart';
import 'package:provider/provider.dart';

import 'domain.dart';

void main() {
  serviceLocatorInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User(id: 'id', name: 'name')),
        ChangeNotifierProvider(create: (_) => ArticleListProvider()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.simpleRouter,
      ),
    );
  }
}
