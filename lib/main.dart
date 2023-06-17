import 'controller/ex_file.dart';
import 'view/screens/add_product.dart';
import 'view/screens/register_screen.dart';
void main() {

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
         selectedItemColor:KColor,
         elevation: 0, unselectedItemColor: KColor2,
          unselectedIconTheme: const IconThemeData(size: 26),
          selectedIconTheme:const IconThemeData(size: 30) ,
          selectedLabelStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),

          backgroundColor: Colors.white10
        )
      ),
      initialRoute:'/onBoard' ,
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
