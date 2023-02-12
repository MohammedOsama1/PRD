
import '../../controller/ex_file.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return  Scaffold(
      appBar:AppBar(
        title:  Text(pro.screenTitles[pro.currentIndex],),
        backgroundColor: KBule,
      ) ,
      body: pro.screens[pro.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.black,
        currentIndex: pro.currentIndex ,
        onTap: (value){
            pro.changeBottomNavBar(value);
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.style_rounded),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),

      ],),
    );
  }
}
