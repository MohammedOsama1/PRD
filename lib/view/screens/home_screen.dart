import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prd/controller/ex_file.dart';

import '../../model/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _currentSlideIndex = 0;

  Widget build(BuildContext context) {
    List show = List.generate(20, (index) => null);
    List<String> _slideImages = [
      'https://picsum.photos/1200/800?random=1',
      'https://picsum.photos/1200/800?random=2',
      'https://picsum.photos/1200/800?random=3',
      'https://picsum.photos/1200/800?random=4',
    ];
    List<CategoryModelItem> _cats = [
      CategoryModelItem(name: 'Phones', Icon: Icons.phone_android),
      CategoryModelItem(name: 'Heads', Icon: Icons.headphones),
      CategoryModelItem(name: 'clothes', Icon: Icons.checkroom_rounded),
      CategoryModelItem(name: 'Laptops', Icon: Icons.laptop),
      CategoryModelItem(name: 'watches', Icon: Icons.watch),
      CategoryModelItem(name: 'Toys', Icon: Icons.toys_outlined),
      CategoryModelItem(name: 'Wallets', Icon: Icons.wallet),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),

          CarouselSlider.builder(
            itemCount: _slideImages.length,
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlideIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black87,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),

                  child: Image.network(
                    _slideImages[index],
                    height: 600,
                    width: 1400,
                    fit: BoxFit.cover,

                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _slideImages.map((imageUrl) {
              int index = _slideImages.indexOf(imageUrl);
              return Container(
                width: 7.0,
                height: 7.0,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentSlideIndex == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text('  Category',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
          SizedBox(height: 10,),
          SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(children:
             _cats.map((e) => Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   Container(
                       width: 60,
                       height: 60,
                       decoration: BoxDecoration(color: KColor,borderRadius: BorderRadius.circular(15)),
                       child: IconButton(onPressed: (){}, icon: Icon(e.Icon,color: Colors.white,size: 30,))),
                   SizedBox(height: 5,),
                   Text(e.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                 ],
               ),
             ),).toList()
             ,),
           ),
          SizedBox(height: 10,),
           Divider(),
           Row(
             children: [
               Text('   Great Offers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               Spacer(),
               Text('  See All   ',style: TextStyle(fontWeight: FontWeight.bold,color: KColor),),

             ],
           ),
           SizedBox(height: 10,),
           Container(
             height: 700,
             padding: EdgeInsets.all(8),
             width: double.infinity,
             child: GridView.extent(
                 maxCrossAxisExtent: 180,
                 mainAxisSpacing: 10,
                 crossAxisSpacing: 10,
                 childAspectRatio: 0.7,
                 children: show.map((e) => buildOneItem()).toList()),
           )




        ],
      ),
    );
  }

  Column buildOneItem() {
    return Column(
        children: [
          Container(
            width: 110,
            height: 175,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 120,
                    height: 110,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                      child: Image(
                        height:MediaQuery.of(context).size.height/20 ,
                        width: MediaQuery.of(context).size.width/5.6,
                        fit: BoxFit.cover,
                        image: const NetworkImage(
                          'https://picsum.photos/400/300',
                        ),
                      ),
                    )),
                SizedBox(height: 3,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' Mac Bok ',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(' 122 \$ ',style: TextStyle(fontWeight: FontWeight.bold),),

                  ],
                ),
                SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('lorem ipsum s my vafav cdfonorem ipsum s my  vafav cdfon',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                ),

              ],
            ),
          ),
        ],
      );
  }
}
