import 'package:prd/controller/ex_file.dart';
import 'package:prd/view/widgets/item_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<CartProvider>(context);

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/1.5,
          child: SingleChildScrollView(
            child: Column(children: pro.cartList.map((e) => _buildIte(context,e,pro)).toList(),),
          ),
        ),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
              height:MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Text('  total Items',style: TextStyle(fontSize: 20),),
                      Spacer(),
                      Text(pro.sumTotalPec().toString(),style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Text('  total price',style: TextStyle(fontSize: 20),),
                    Spacer(),
                    Text(' ${pro.sumTotalPrice() } EG ',style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 1, horizontal: 40),
                  width: MediaQuery.of(context).size.width/2.5,
                  height: 40,
                  decoration: BoxDecoration(
                      color: KColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
  Stack _buildIte(BuildContext context,e,pro) {
    List<String> txt = e.productTitle!.split(" ");
    String title = txt.take(1).join(" ");
    return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height/7,
                padding: const EdgeInsets.all(10.0),
                child: Card(
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
                                     Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                   ],
                                 ),
                                 Text(e.category,style: TextStyle(fontSize: 16,color: Colors.grey)),
                                Text('\EG${e.price}',style: TextStyle(color: KColor,fontWeight: FontWeight.w600),),
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
