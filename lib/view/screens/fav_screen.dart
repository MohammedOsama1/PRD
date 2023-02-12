import 'package:flutter/material.dart';
import 'package:prd/view/widgets/item_details.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 2,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Image(
                              width: 70,
                              height: 70,
                              image: NetworkImage(
                                'https://m.media-amazon.com/images/I/41i7KfBITBL._AC_SX679_.jpg',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Product 1',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Iphone Iphone Iphone Iphone',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(1),
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
              ),
            ),
          ),).toList()


        ,
      ),
    );
  }
}
