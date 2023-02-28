


import 'controller/ex_file.dart';
void main() {

  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context)=>MyProvider(),
      child: const MyApp()));
}

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
          elevation: 0,
          unselectedItemColor: KColor2,

          unselectedIconTheme: const IconThemeData(size: 26),
          selectedIconTheme:const IconThemeData(size: 30) ,
          selectedLabelStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),

          backgroundColor: Colors.white10
        )
      ),
      initialRoute:'/layout' ,

      routes: {
        '/onBoard' : (context)=>const OnBoardingScreen(),
        '/login' :(context) => LoginScreen(),
        '/layout' :(context) => const LayoutScreen(),

      },
    );
  }
}
// 0062d1
//007dfe
