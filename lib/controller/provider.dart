

import 'ex_file.dart';

class MyProvider extends ChangeNotifier {

  int currentIndex = 0 ;
  List<Widget> screens = [
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


class HomeProvider extends ChangeNotifier {

  int currentSlideIndex = 0;

  changeImage (index){
    this.currentSlideIndex = index;
    notifyListeners();
  }

}

class CartProvider extends ChangeNotifier {


}

class FavProvider extends ChangeNotifier {


}