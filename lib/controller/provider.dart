

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

  bool isDark = true;
  void changeTheme(){
    isDark= !isDark;
    notifyListeners();
}

  bool passwordState = false ;
  void showPassword () {
    passwordState != passwordState;
    notifyListeners(); }


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
  List<Item> cartList = [];
  List<int> quantities = [];

  void addToCart(Item item, int quantity) {
    cartList.add(item);
    quantities.add(quantity);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    final index = cartList.indexOf(item);
    if (index != -1) {
      cartList.removeAt(index);
      quantities.removeAt(index);
      notifyListeners();
    }
  }

  int sumTotalPrice() {
    int sum = 0;
    for (int i = 0; i < cartList.length; i++) {
      sum += cartList[i].price! * quantities[i];
    }
    return sum;
  }
  int sumTotalPec() {
    int sum = 0;
    quantities.forEach((element) {
      sum+= element ;
    });
    return sum;
  }
}

class FavProvider extends ChangeNotifier {
  List<Item> FavList = [];
  addRemToFav(Item item){
    print(FavList);
    FavList.contains(item)? FavList.remove(item) :FavList.add(item);
    notifyListeners();
}

}