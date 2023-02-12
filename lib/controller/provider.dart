

import 'ex_file.dart';

class MyProvider extends ChangeNotifier {

  int currentIndex = 0 ;
  List<Widget> screens = const[
    HomeScreen(),CategoryScreen(),FavoriteScreen(),SettingsScreen()
  ];
  List<String> screenTitles = const[
    'Home Screen','Categories Screen','Favourites Screen','Settings Screen'
  ];

 void changeBottomNavBar(index) {
    currentIndex = index;
    notifyListeners();
  }
}
