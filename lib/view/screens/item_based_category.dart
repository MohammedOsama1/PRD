import 'package:prd/model/Item.dart';
import 'package:prd/view/widgets/item_details.dart';

import '../../controller/ex_file.dart';

class ItemsBasedCat extends StatelessWidget {
   ItemsBasedCat({Key? key, required this.CatName, required this.Catid}) : super(key: key);
 final String CatName ;
 final int Catid ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CatName),
        backgroundColor: KColor,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: bloc.Itemz,
          builder: (context, snapshot) {
            return Column(
              children: snapshot.data!.where((element) => element.catId == Catid).map((e) =>  buildInkWell(context, e),).toList()
            );
          }
        ),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context, Item e) {
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
                color: Colors.white,
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
                                  Text(title,maxLines:2,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: KAllWhite)),
                                ],
                              ),
                               Text(txt.take(5).join(" "),style: TextStyle(fontSize: 12,color: Colors.grey)),
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

            Positioned(
                right: 15,
                top: 26,
                child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(8),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: KColor),
                    child: const Icon(
                      Icons.favorite,
                      size: 22,

                      color: Colors.white,
                    )))
          ],
        ),
      );
  }
}
