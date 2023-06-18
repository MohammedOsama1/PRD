import 'package:prd/controller/save_helper.dart';

import 'controller/ex_file.dart';
import 'view/screens/add_product.dart';
import 'view/screens/register_screen.dart';
void main() async  {
  await CacheHelper.init();
  if  (await CacheHelper.getData('isDark') == null) {
    CacheHelper.addData('isDark', false.toString());
  }
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
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: Themes.customDark,
      theme: Themes.customLight,
      themeMode: CacheHelper.getData('isDark') == 'true' ? ThemeMode.dark : ThemeMode.light,
      initialRoute:'/onBoard',
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
// 0062d1
//007dfe

