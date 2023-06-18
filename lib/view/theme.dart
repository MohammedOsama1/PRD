import 'package:flutter/material.dart';
import 'package:prd/controller/BLoC.dart';
import 'package:prd/model/user.dart';

Color KColor = const Color(0xff0062d1);
Color KCBackground = AllWhite;
Color AllWhite = Colors.white;
Color KAllBlack = Colors.black;
Color KColor2 = const Color(0xff007dfe);

BLoC bloc = BLoC();
late UserData user ;

// Color KBule = const Color(0xff0062d1);
// Color KCyan = const Color(0xff007dfe);




class Themes {
  static ThemeData get customDark {
    return ThemeData.dark().copyWith(
        primaryColor: KColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: KColor,
          selectedItemColor: KColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
        ),
        appBarTheme:
        const AppBarTheme(color: Colors.transparent, elevation: 0));
  }

  static ThemeData get customLight {
    return ThemeData.light().copyWith(
        primaryColor: KColor,
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
            selectedItemColor:KColor,
            elevation: 0, unselectedItemColor: KColor2,
            unselectedIconTheme: const IconThemeData(size: 26),
            selectedIconTheme:const IconThemeData(size: 30) ,
            selectedLabelStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
            backgroundColor: Colors.white10
        ),
        appBarTheme:
     AppBarTheme(color: KColor, elevation: 0));
  }

}
TextStyle  primaryStyle (context){
  return  TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      // color:  CashHelper.getData('isDark')? Colors.white :Colors.black
  );
}