import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prd/controller/ex_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    List show = List.generate(20, (index) => null);
    int _currentSlideIndex = 0;
    List<String> _slideImages = [
      'https://picsum.photos/600/800?random=1',
      'https://picsum.photos/600/800?random=2',
      'https://picsum.photos/600/800?random=3',
      'https://picsum.photos/600/800?random=4',
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: _slideImages.length,
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 1.1,
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
                  color: Colors.white,
                ),
                child: Image.network(

                  _slideImages[index],
                  height: 600,
                  width: 800,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
           SizedBox(height: 10),
           SingleChildScrollView(

             scrollDirection: Axis.horizontal,

             child: Row(children: [
               SizedBox(width: 5),
               Container(
                 width: 50,
                   height: 50,
                   decoration: BoxDecoration(color: KColor,borderRadius: BorderRadius.circular(15)),
                   child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_vintage_outlined,color: Colors.white,))),
               SizedBox(width: 10),
               Container(
                 width: 120,
                   height: 50,
                   decoration: BoxDecoration(color: KColor,borderRadius: BorderRadius.circular(15)),
                   child: Row(
                     children: [
                       IconButton(onPressed: (){}, icon: Icon(Icons.filter_vintage_outlined,color: Colors.white,)),
                       Text('HeadSet',style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   )),
               SizedBox(width: 10),
               Container(
                 width: 120,
                   height: 50,
                   decoration: BoxDecoration(color: KColor,borderRadius: BorderRadius.circular(15)),
                   child: Row(
                     children: [
                       IconButton(onPressed: (){}, icon: Icon(Icons.filter_vintage_outlined,color: Colors.white,)),
                       Text('HeadSet',style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   )),
               SizedBox(width: 10),
               Container(
                 width: 120,
                   height: 50,
                   decoration: BoxDecoration(color: KColor,borderRadius: BorderRadius.circular(15)),
                   child: Row(
                     children: [
                       IconButton(onPressed: (){}, icon: Icon(Icons.filter_vintage_outlined,color: Colors.white,)),
                       Text('HeadSet',style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   )),
             ],),
           ),
          SizedBox(height: 20,),
           Row(
             children: [
               Text('   Hot Sales',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               Spacer(),
               Text('  See All ',style: TextStyle(fontWeight: FontWeight.bold),),

             ],
           ),
           SizedBox(height: 10,),
           Container(
             height: 700,
             width: double.infinity,
             child: GridView.extent(
                 maxCrossAxisExtent: 180,
                 childAspectRatio: 0.75,
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
            width: 120,
            height: 175,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                      child: Image(
                        height:MediaQuery.of(context).size.height/11 ,
                        width: MediaQuery.of(context).size.width/4.6,
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
                    Text('Mac Bok ',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('122 \$ ',style: TextStyle(fontWeight: FontWeight.bold),),

                  ],
                ),
                SizedBox(height: 2,),
                Text('lorem ipsum s my vafav cdfonorem ipsum s my vafav cdfon',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

              ],
            ),
          ),
        ],
      );
  }
}
