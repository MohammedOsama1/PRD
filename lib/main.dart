import 'dart:io';

import 'package:flutter/services.dart';
import 'package:prd/controller/save_helper.dart';

import 'controller/badCertificateHandler.dart';
import 'controller/ex_file.dart';
import 'view/screens/add_product.dart';
import 'view/screens/register_screen.dart';
void main() async  {
  HttpOverrides.global = new DevHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MyProvider>(
            create: (context) => MyProvider(),
          ),
          ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
          ),
          ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider<FavProvider>(
            create: (context) => FavProvider(),
          ),
        ],
        child: const MyApp(),
      )
  );
}
//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
//php artisan serv --host=0.0.0.0
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
 // String toBoarding =  CacheHelper.getData('onState');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: Themes.customDark,
      theme: Themes.customLight,
      themeMode: CacheHelper.getData('isDark') == 'true' ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/onBoard',
      routes: {
        '/onBoard' : (context)=>const OnBoardingScreen(),
        '/login' :(context) => LoginScreen(),
        '/register' :(context) => RegisterScreen(),
        '/layout' :(context) => const LayoutScreen(),
        '/editScreen' :(context) =>  AddProductScreen(),
      },
    );
  }
}


