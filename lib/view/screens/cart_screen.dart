import 'package:prd/controller/ex_file.dart';
import 'package:prd/view/widgets/item_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<CartProvider>(context);
    final pro2 = Provider.of<MyProvider>(context);

    return Column(
      children: [
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(children: pro.cartList.map((e) => _buildIte(context,e,pro,pro2)).toList(),),
            ),
          ),
        ),
        Card(
          elevation: 10,
         color: pro2.isDark?  Colors.white30 :AllWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
              height:MediaQuery.of(context).size.height/6+10,
              width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Text('  total Items',style: TextStyle(fontSize: 20,color: pro2.isDark?  Colors.white :KAllBlack,),),
                      Spacer(),
                      Text(pro.sumTotalPec().toString(),style: TextStyle(fontSize: 18,color: pro2.isDark?  Colors.white :KAllBlack,),),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Text('  total price',style: TextStyle(fontSize: 20,color: pro2.isDark?  Colors.white :KAllBlack,),),
                    Spacer(),
                    Text(' ${pro.sumTotalPrice() } EG ',style: TextStyle(fontSize: 18,color: pro2.isDark?  Colors.white :KAllBlack,),),
                  ],
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () async{

                    pro.clearList(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 1, horizontal: 40),
                    width: MediaQuery.of(context).size.width/2.5,
                    height: 40,
                    decoration: BoxDecoration(
                        color: KColor,
                        borderRadius: BorderRadius.circular(20)),
                    child:  Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AllWhite),
                      ),
                    ),
                  ),
                )
              ],
            ),
    ),
        )
      ],
    );
  }
  Stack _buildIte(BuildContext context,e,pro,pro2) {
    List<String> txt = e.productTitle!.split(" ");
    String title = txt.take(1).join(" ");
    return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height/7,
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: pro2.isDark?  Colors.white30 :AllWhite,
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(item: e,)));

                        },
                        child: Image(
                          height:MediaQuery.of(context).size.height/11 ,
                          width: MediaQuery.of(context).size.width/4.6,
                          fit: BoxFit.cover,
                          image:  NetworkImage(
                            e.image,
                          ),
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
                                     Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,  color: pro2.isDark?  Colors.white :Colors.black,)),
                                   ],
                                 ),
                                 Text(e.category,style: TextStyle(fontSize: 16                ,  color: pro2.isDark?  Colors.white :Colors.black,
                                 )),
                                Text('\EG${e.price}',style: TextStyle(fontWeight: FontWeight.w600, color: pro2.isDark?  Colors.blue :KColor),),
                              ],
                            ),
                            SizedBox(width: 100,),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 30,
                  child: InkWell(onTap: (){
                    pro.removeFromCart(e);
                  }, child: Icon(Icons.close,size: 30,color: Colors.redAccent,)))

            ],
          );
  }
}
