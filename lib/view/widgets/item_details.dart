import 'package:fl_chart/fl_chart.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/model/Item.dart';
import 'package:prd/view/screens/add_product.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int touchedIndex = -1;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    List<String> txt = widget.item.productTitle!.split(" ");
    String title = txt.take(6).join(" ");
    final pro = Provider.of<FavProvider>(context);
    final pro2 = Provider.of<MyProvider>(context);
    final proCart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: KColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                pro.addRemToFav(widget.item);
              },
              icon: pro.FavList.contains(widget.item)
                  ? Icon(
                      Icons.favorite,
                      size: 22,
                      color: AllWhite,
                    )
                  : Icon(
                      Icons.favorite_border_outlined,
                      size: 22,
                      color: AllWhite,
                    ))
        ],
      ),
      backgroundColor: pro2.isDark ? KAllBlack : AllWhite,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: AspectRatio(
                          aspectRatio: 1.5, // Adjust the aspect ratio as needed
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.item.image!,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: pro2.isDark ? AllWhite : KAllBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\EG ${widget.item.price} ",
                          style: TextStyle(
                              color: pro2.isDark ? AllWhite : KAllBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 38),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                    print(quantity);
                                  });
                                },
                                child: Container(
                                    color: KColor,
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                      color: AllWhite,
                                    ))),
                            Text(
                              "  $quantity  ",
                              style: TextStyle(
                                  color: pro2.isDark ? AllWhite : KAllBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    quantity > 1 ? quantity-- : print("");
                                  });
                                },
                                child: Container(
                                    color: KColor,
                                    child: Icon(
                                      Icons.remove,
                                      size: 25,
                                      color: AllWhite,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              color: KColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Spacer(),
                        user.user!.id! > 6999
                            ? IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AddProductScreen(
                                                item: widget.item,
                                              )));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                ))
                            : SizedBox(),
                        SizedBox(
                          width: 12,
                        ),
                        user.user!.id! > 6999
                            ? IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            content: Text(
                                              'Are you sure you want to delete this item ?',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  bloc
                                                      .deleteItem(
                                                          widget.item.iD,
                                                          context)
                                                      .then((value) =>
                                                          Navigator.pop(
                                                              context));
                                                },
                                                child: Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: KColor,
                                                      fontSize: 24),
                                                ),
                                              )
                                            ],
                                          ));
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ))
                            : SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.item.productTitle!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1.5,
                          color: pro2.isDark ? AllWhite : Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 17,
                    ),
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
                            children: <Widget>[
                              indicator(
                                pro2: pro2,
                                color: Colors.red.shade700,
                                text: ' Positive',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              indicator(
                                pro2: pro2,
                                color: Colors.yellow,
                                text: ' neutral',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              indicator(
                                pro2: pro2,
                                color: KColor,
                                text: ' Negative',
                              ),
                            ],
                          ),
                          Spacer(),
                          AspectRatio(
                            aspectRatio: 1.4,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
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
                                sections: showingSections(pro2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    InkWell(
                      onTap: () {
                        proCart.addToCart(widget.item, quantity);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: KColor),
                        child: Center(
                            child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: AllWhite,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(pro2) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;

      switch (i) {
        case 0:
          double positivePercentage = double.parse(widget.item.positive!) /
              double.parse(widget.item.reviewsNumber!.toString());
          String positiveTitle = (positivePercentage * 100).toStringAsFixed(0);

          return PieChartSectionData(
            value: positivePercentage,
            title: '$positiveTitle%',
            color: KColor,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          double negativePercentage = double.parse(widget.item.negative!) /
              double.parse(widget.item.reviewsNumber!.toString());
          String negativeTitle = (negativePercentage * 100).toStringAsFixed(0);

          return PieChartSectionData(
            value: negativePercentage,
            color: Colors.red.shade700,
            title: '$negativeTitle%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          double neutralPercentage = double.parse(widget.item.neutral!) /
              double.parse(widget.item.reviewsNumber!.toString());
          String neutralTitle = (neutralPercentage * 100).toStringAsFixed(0);

          return PieChartSectionData(
            value: neutralPercentage,
            color: Colors.yellow,
            title: '$neutralTitle%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  Row indicator({required color, required String text, required pro2}) {
    return Row(
      children: [
        Container(
          color: color,
          width: 20,
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: pro2.isDark ? AllWhite : KAllBlack,
          ),
        ),
      ],
    );
  }
}

// RiveAnimation.network(
//           'https://cdn.rive.app/animations/vehicles.riv',
//         ),
