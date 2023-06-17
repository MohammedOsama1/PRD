import 'package:carousel_slider/carousel_slider.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/model/Item.dart';

import '../../model/category_item.dart';
import '../widgets/item_details.dart';


class HomeScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final pro = Provider.of<HomeProvider>(context);
    List<String> _slideImages = [
      'https://picsum.photos/1200/800?random=1',
      'https://picsum.photos/1200/800?random=2',
      'https://picsum.photos/1200/800?random=3',
      'https://picsum.photos/1200/800?random=4',
    ];
    List<CategoryModelItem> _cats = [
      CategoryModelItem(name: 'Phones', Icon: Icons.phone_android),
      CategoryModelItem(name: 'Heads', Icon: Icons.headphones),
      CategoryModelItem(name: 'notebook', Icon: Icons.edit_note_sharp),
      CategoryModelItem(name: 'Laptops', Icon: Icons.laptop),
      CategoryModelItem(name: 'jtool', Icon: Icons.handyman),
      CategoryModelItem(name: 'copen', Icon: Icons.toys_outlined),
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
              pro.changeImage(index);
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
                  color: pro.currentSlideIndex == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text('  Category',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: KAllWhite),),
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
                   Text(e.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: KAllWhite),)
                 ],
               ),
             ),).toList()
             ,),
           ),
          SizedBox(height: 10,),
           Divider(),
           Row(
             children: [
               Text('   Great Offers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: KAllWhite),),
               Spacer(),
               Text('  See All   ',style: TextStyle(fontWeight: FontWeight.bold,color: KColor),),

             ],
           ),
           SizedBox(height: 10,),
           Container(
             height: 700,
             padding: EdgeInsets.all(8),
             width: double.infinity,
             child: StreamBuilder(
               stream: bloc.Itemz,
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   return GridView.extent(
                     physics: NeverScrollableScrollPhysics(),
                     maxCrossAxisExtent: 200,
                     mainAxisSpacing: 20,
                     crossAxisSpacing: 10,
                     childAspectRatio: 0.76,
                     children: snapshot.data!.map((e) => buildOneItem(e,context)).toList(),
                   );
                 } else if (snapshot.hasError) {
                   return Text('Error: ${snapshot.error}');
                 } else {
                   return CircularProgressIndicator();
                 }
               },
             ),

           )

        ],
      ),
    );
  }

  GestureDetector buildOneItem(Item e, context) {
    List<String> txt = e.productTitle!.split(" ");
    String title = txt.take(3).join(" ");

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ItemDetails(item: e)));
      },
      child: Container(
        width: 140,
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image(
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
                image: NetworkImage(e.image!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,bottom: 8,top: 4),
              child: Text(
                '${e.price}\$',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                e.productTitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
