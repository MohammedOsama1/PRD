import 'package:prd/model/Item.dart';
import 'package:prd/view/widgets/item_details.dart';

import '../../controller/ex_file.dart';

class ItemsBasedCat extends StatelessWidget {
   ItemsBasedCat({Key? key, required this.CatName, required this.Catid}) : super(key: key);
 final String CatName ;
 final int Catid ;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(CatName),
        backgroundColor: KColor,
      ),
      backgroundColor: pro.isDark?KAllBlack:AllWhite,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: bloc.Itemz,
          builder: (context, snapshot) {
            return Column(
              children: snapshot.data!.where((element) => element.catId == Catid).map((e) =>  buildInkWell(context, e,pro),).toList()
            );
          }
        ),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context, Item e,pro) {
    List<String> txt = e.productTitle!.split(" ");
    String title = txt.take(3).join(" ");
    return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(item: e,)));
        },
        child: Stack(
          children: [
            Container(width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height/7,
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: pro.isDark?Colors.white30:AllWhite,
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
                                  Text(title,maxLines:2,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: pro.isDark?AllWhite:KAllBlack,)),
                                ],
                              ),
                               Text(txt.take(5).join(" "),style: TextStyle(fontSize: 12,color: pro.isDark?AllWhite:Colors.grey)),
                              Text('\EG${e.price}',style: TextStyle(color: KColor,fontWeight: FontWeight.w600),),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      );
  }
}
