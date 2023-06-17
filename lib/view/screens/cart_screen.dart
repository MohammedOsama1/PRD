import 'package:prd/controller/ex_file.dart';
import 'package:prd/view/widgets/item_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);

    List ll = List.generate(20, (index) => index);
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/1.5,
          child: SingleChildScrollView(
            child: Column(children: ll.map((e) => buildIte(context)).toList(),),
          ),
        ),
        Card(

          elevation: 10,
          child: Container(
              height:MediaQuery.of(context).size.height/7.1,
              width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(),
                Row(
                  children: [
                    Text('  total Items',style: TextStyle(fontSize: 20),),
                    Spacer(),
                    Text('65 ',style: TextStyle(fontSize: 18),),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text('  total price',style: TextStyle(fontSize: 20),),
                    Spacer(),
                    Text('\$ 221 ',style: TextStyle(fontSize: 18),),

                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 1, horizontal: 40),
                  width: MediaQuery.of(context).size.width/2.5,
                  height: 30,
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

  Stack buildIte(BuildContext context) {
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(item: bloc.item.first,)));

                        },
                        child: Image(
                          height:MediaQuery.of(context).size.height/11 ,
                          width: MediaQuery.of(context).size.width/4.6,
                          fit: BoxFit.cover,
                          image: const NetworkImage(
                            'https://picsum.photos/400/300',
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
                                     Text('item one example',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                   ],
                                 ),
                                const Text('Phones',style: TextStyle(fontSize: 16,color: Colors.grey)),
                                Text('\$16',style: TextStyle(color: KColor,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Row(
                              children:  [
                                const SizedBox(width: 20,),
                                Container(color:KColor,child: Icon(Icons.add,size: 18,color: Colors.white,)),
                                const Text(
                                  "  1  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(color:KColor,child: Icon(Icons.remove,size: 18,color: Colors.white,)),
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
                top: 5,
                right: 5,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 16,color: Colors.grey,)))

            ],
          );
  }
}
