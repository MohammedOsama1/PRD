
import '../../controller/ex_file.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return  Scaffold(
      appBar:AppBar(
        title:  Text(pro.screenTitles[pro.currentIndex],style: TextStyle(color: Colors.white),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,))],
        backgroundColor: KColor,
      ) ,
      backgroundColor: KCBackground,

      body: pro.screens[pro.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pro.currentIndex ,
        onTap: (value){
            pro.changeBottomNavBar(value);
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_suggest_outlined),label: 'Setting'),

      ],),
    );
  }
}
