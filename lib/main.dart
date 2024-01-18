import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda_admin/constants/colors.dart';
import 'package:foodpanda_admin/providers/authentication_provider.dart';
import 'package:foodpanda_admin/providers/internet_provider.dart';
import 'package:foodpanda_admin/router.dart';
import 'package:foodpanda_admin/splash_screen/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodPanda Admin',
        theme: ThemeData(
          // useMaterial3: true,
          colorScheme: scheme,
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          unselectedWidgetColor: scheme.primary,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
