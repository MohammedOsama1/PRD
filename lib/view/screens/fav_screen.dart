import 'package:prd/model/Item.dart';
import 'package:prd/view/widgets/item_details.dart';

import '../../controller/ex_file.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<FavProvider>(context);
    final pro2 = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children:
        pro.FavList.map((e) =>  InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(item: e,)));
            },
            child: buildStack(context, e,pro,pro2),
          ),).toList()
        ,
      ),
    );
  }

  Stack buildStack(BuildContext context, Item e,pro,pro2) {
    List<String> txt = e.productTitle!.split(" ");
    String title = txt.take(3).join(" ");
    return Stack(
            children: [
              Container(width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height/7,
                padding: const EdgeInsets.all(10.0),
                child: Card(
    color: pro2.isDark?  Colors.white38 :Colors.white,
    child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Image(
                        height:MediaQuery.of(context).size.height/11 ,
                        width: MediaQuery.of(context).size.width/4.6,
                        fit: BoxFit.cover,
                        image:  NetworkImage(
                          e.image!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(title,maxLines:2,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: pro2.isDark?  AllWhite :KAllBlack,)),
                                  ],
                                ),
                                Text(txt.take(5).join(" "),style: TextStyle(fontSize: 12,color: pro2.isDark?  AllWhite :KAllBlack,)),
                                Text('\EG${e.price}',style: TextStyle(fontWeight: FontWeight.w600,color: pro2.isDark?  AllWhite :KColor,),),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 15,
                  top: 26,
                  child: GestureDetector(
                    onTap: ()=> pro.addRemToFav(e)
                    ,
                    child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.all(8),
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: KColor),
                        child:  Icon(
                          Icons.favorite,
                          size: 22,
                          color: AllWhite,
                        )),
                  ))
            ],
          );
  }
}
