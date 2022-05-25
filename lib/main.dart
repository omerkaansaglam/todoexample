import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoexample/core/constants/app/app_constant.dart';
import 'package:todoexample/core/constants/routes/router.dart';
import 'package:todoexample/core/init/notifier/providers.dart';
import 'package:todoexample/core/init/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      title: AppConstants.APPLICATION_NAME,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
