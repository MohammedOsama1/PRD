import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prd/view/theme.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor:KColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      color: KColor,
                    ),
                    Positioned(
                        left: 30,
                        top: 20,
                        right: 30,
                        child:  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://picsum.photos/400/300',
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                    "Great expensive item ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                    const SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\$275 ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        const Spacer(),
                        Row(
                          children:  [
                            const SizedBox(width: 20,),
                            Container(color:KColor,child: Icon(Icons.add,size: 25,color: Colors.white,)),
                            const Text(
                              "  1  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            ),
                            Container(color:KColor,child: Icon(Icons.remove,size: 25,color: Colors.white,)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    const Divider(),
                    const SizedBox(height: 12,),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: KColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                      "manufacturer's warranty for a product you can contact the manufacturer directly or visit their website for more information. Manufacturer's warranties may not apply in all cases, depending on factors like the use of the product, where the product was purchased, or who you purchased the product from. Please review the warranty carefully, and contact the manufacturer if you have any questions.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.5,

                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                    ),
                    const SizedBox(height: 17,),
                    const Divider(),

                    const SizedBox(height: 17,),
                    Text(
                      "Rates",
                      style: TextStyle(
                          color: KColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    AspectRatio(
                      aspectRatio: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  <Widget>[
                              indicator(
                                color: Colors.red.shade700,
                                text: ' Positive',

                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              indicator(
                                color: Colors.yellow,
                                text: ' neutral',

                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              indicator(
                                color: KColor,
                                text: ' Negative',

                              ),

                            ],),
                          Spacer(),
                          AspectRatio(
                            aspectRatio: 1.4,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection == null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  },
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:KColor
                      ) ,
                    child: Center(child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),)),)


                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            value: 40,
            title: '40%',
            color: KColor,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          );
        case 1:
          return PieChartSectionData(
            value: 30,
            color: Colors.red.shade700,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          );
        case 2:
          return PieChartSectionData(
            value: 15,
            color: Colors.yellow,

            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
                color: Colors.white

            ),
          );
        default:
          throw Error();
      }
    });
  }

  Row indicator({required color, required String text}) {
    return Row(
      children: [
        Container(
          color: color,
          width: 20,
          height: 20,
        ),
        Text(text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ],
    );
  }
}

