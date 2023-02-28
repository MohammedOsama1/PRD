import 'package:prd/controller/ex_file.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(width: 50,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(height: 25,),

            Icon(Icons.account_circle,color:KColor,size: 120,),
            const SizedBox(height: 15,),

            buildCard(txt:'Edit information',icon: Icons.edit),
            const SizedBox(height: 30,),
            buildCard(txt:'Language',icon: Icons.ac_unit),
            const SizedBox(height: 30,),

            buildCard(txt:'DarkMode',icon: Icons.light_mode_outlined),
            const SizedBox(height: 30,),

            buildCard(txt:'Logout',icon: Icons.logout),





          ],
        ),
      ],
    );
  }

  Card buildCard({required String txt,required IconData icon}) {
    return Card(
        elevation: 5,
        child: SizedBox(
            width: 300,
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(icon,color: KColor2,),
                  Text(' $txt   ',style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.w700,color: KColor2
                  ),),
                  Icon(Icons.arrow_forward_ios,color: KColor2,),

                ],
              ),
            )),);
  }
}
