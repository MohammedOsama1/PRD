


import 'package:prd/model/Item.dart';
import 'package:prd/view/widgets/loading_ind.dart';

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

  bool isDark = false;
  void changeTheme(){
    isDark= !isDark;
    notifyListeners();
}

  bool passwordState = true ;
  void showPassword () {
    passwordState = !passwordState;
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
  void ccc() {

    cartList.clear();
    quantities.clear();
    notifyListeners();
  }
  void clearList(ctx) async{
    if(cartList.isNotEmpty) {
      await showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        content: Text(
          'Items Placed Successful',
          style: TextStyle(color: KColor),
        ),
        title: Text('Done :)'),
      ));
      cartList.clear();
      quantities.clear();
      notifyListeners();
    }

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



  List<Item> FavList = bloc.item.where((item) => bloc.favIds.where((element) => element.product_Id! == item.iD!).isNotEmpty ).toList();

  init(context) {
    if(bloc.item.where((item) => bloc.favIds.where((element) => element.product_Id! == item.iD!).isNotEmpty ).toList().isNotEmpty) {
      FavList = bloc.item.where((item) => bloc.favIds.where((element) => element.product_Id! == item.iD!).isNotEmpty ).toList();
    }
    print(FavList);
  }
  addRemToFav(Item item){
    print(bloc.favIds.length);
    FavList.contains(item)? FavList.remove(item) : FavList.add(item);
    bloc.addItemToFav(item.iD!);
    notifyListeners();
}
  del(item){
    FavList.remove(item);
    notifyListeners();
  }


}