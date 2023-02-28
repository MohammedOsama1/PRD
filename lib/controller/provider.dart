

import 'ex_file.dart';

class MyProvider extends ChangeNotifier {

  int currentIndex = 0 ;
  List<Widget> screens = const[
    HomeScreen(),FavoriteScreen(),CategoryScreen(),SettingsScreen()
  ];
  List<String> screenTitles = const[
    'Home Screen','Favourite Screen','Cart Screen','Settings Screen'
  ];

 void changeBottomNavBar(index) {
    currentIndex = index;
    notifyListeners();
  }
}
