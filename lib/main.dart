
import 'package:prd/view/login_screen.dart';

import 'controller/ex_file.dart';
void main() {
  runApp(const MyApp());
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
      ),
      initialRoute:'/onBoard' ,
      routes: {
        '/onBoard' : (context)=>const OnBoardingScreen(),
        '/login' :(context) => LoginScreen()
      },
    );
  }
}
// 0062d1
//007dfe
