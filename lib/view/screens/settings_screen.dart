import 'package:prd/controller/ex_file.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(height: 25,),
            Icon(Icons.account_circle,color:pro.isDark?  AllWhite :KColor,size: 120,),
            Text("Hello, ${user.name!}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: pro.isDark?  AllWhite :KAllBlack),),
            const SizedBox(height: 15,),
            user.userType == "admin"?
            buildCard(txt:'Add Product',icon: Icons.edit,
                pro:pro, context: context,fun: (){
              Navigator.pushNamed(context,'/editScreen');
            }):Container(),
            const SizedBox(height: 30,),
            buildCard(pro: pro,
                txt: !pro.isDark?'DarkMode':'LightMode',icon: Icons.light_mode_outlined ,context: context ,fun: (){
              pro.changeTheme();
            }),
            const SizedBox(height: 30,),
            buildCard(pro: pro,txt:'Logout',icon: Icons.logout,context: context ,fun: (){
              pro.currentIndex = 0;
              bloc.logOut(context);
            }),

          ],
        ),
      ],
    );

  }
  GestureDetector buildCard({required String txt,required pro,required IconData icon,required context,required Function () fun}) {
    return GestureDetector(
      onTap:
      fun
      ,
      child: Card(
        color: pro.isDark?  Colors.white24 :AllWhite,
        elevation: 5,
        child: SizedBox(
            width: 300,
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(icon,  color: pro.isDark?  Colors.white :KColor,),
                  Text(' $txt   ',style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.w700,  color: pro.isDark?  Colors.white :KColor,
                  ),),
                  Icon(Icons.arrow_forward_ios, color: pro.isDark?  Colors.white :KColor,),

                ],
              ),
            )),),
    );
  }

}
