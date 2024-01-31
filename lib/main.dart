import 'package:ecommerce/const/themes.dart';
import 'package:ecommerce/features/auth/service/service.dart';
import 'package:ecommerce/features/splashScreen/splash_screen.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Service service = Service();
  // This widget is the root of your application.
  void initState() {
    super.initState();
    service.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>().theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: provider == ThemeData.light() ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
