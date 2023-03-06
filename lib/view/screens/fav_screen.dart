import 'package:flutter/material.dart';
import 'package:prd/view/widgets/item_details.dart';

import '../theme.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   List em = List.generate(20, (index) => 'null');
    return SingleChildScrollView(
      child: Column(
        children:
          em.map((e) =>  InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails()));
            },
            child: Stack(
              children: [
                Container(width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height/7,
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Image(
                          height:MediaQuery.of(context).size.height/11 ,
                          width: MediaQuery.of(context).size.width/4.6,
                          fit: BoxFit.cover,
                          image: const NetworkImage(
                            'https://picsum.photos/400/300',
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
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Colors.pink),
                        child: const Icon(
                          Icons.favorite,
                          size: 25,

                          color: Colors.white,
                        )))
              ],
            ),
          ),).toList()


        ,
      ),
    );
  }
}
