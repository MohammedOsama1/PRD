

import 'package:prd/model/Item.dart';

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


  List<Item> _filteredData = [];
  bool _isLoading = false;

  List<Item> get filteredData => _filteredData;
  bool get isLoading => _isLoading;

  void setFilteredData(List<Item> filteredData) {
  _filteredData = filteredData;
  notifyListeners();
  }

  void setLoading(bool isLoading) {
  _isLoading = isLoading;
  notifyListeners();
  }



}

class CartProvider extends ChangeNotifier {


}

class FavProvider extends ChangeNotifier {


}