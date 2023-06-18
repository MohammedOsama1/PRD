
import 'package:prd/view/screens/search_screen.dart';

import '../../controller/ex_file.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return  Scaffold(
      appBar:AppBar(
        title:  Text(pro.screenTitles[pro.currentIndex],style: TextStyle(color: AllWhite),),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchScreen()));

        }, icon: Icon(Icons.search,color: AllWhite,))],
        backgroundColor: KColor,
      ) ,
      backgroundColor: pro.isDark?  KAllBlack :AllWhite,

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
