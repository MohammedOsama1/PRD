import 'package:flutter/material.dart';
import 'package:prd/model/Item.dart';
import 'package:prd/view/theme.dart';
import 'package:prd/view/widgets/txtFF.dart';

import '../../controller/ex_file.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key, this.item}) : super(key: key);
  final Item? item ;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var titleCont = TextEditingController();

  var priceCont = TextEditingController();

  var descriptionCont = TextEditingController();

  var category = TextEditingController();

  var imgUrlCont = TextEditingController();

  var selectedcont = TextEditingController();

  var NeuralCont = TextEditingController();
  var NegativeCont = TextEditingController();
  var PostiveCont = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  String selectedCategory = "Copen";

  List<String> categoryList = [
    "Copen",
    "Heads",
    "Jtool",
    "Laptops",
    "Notebook",
    "Phones"
  ];

  @override
  void initState() {
    if (widget.item!= null )
      {
         titleCont.text = widget.item!.productTitle! ;

         priceCont.text = widget.item!.price!.toString() ;

         descriptionCont.text = widget.item!.productTitle!;

         category.text = widget.item!.category!;

         imgUrlCont.text = widget.item!.image!;

         selectedcont.text = widget.item!.category!;

         NeuralCont.text = widget.item!.neutral!;
         NegativeCont.text = widget.item!.negative!;
         PostiveCont.text = widget.item!.positive!;
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item== null?'Add New Product':'Edit Product',
        ),
        backgroundColor: KColor,
      ),
      backgroundColor: pro.isDark? KAllBlack : AllWhite,
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 30,
              ),
              DefaultTTF(
                color:  pro.isDark?  AllWhite :KAllBlack,
                  label: ' title',
                  controller: titleCont,
                  prefixIcon:  Icon(Icons.title,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  color:  pro.isDark?  AllWhite :KAllBlack,
                  label: 'Price',
                  controller: priceCont,
                  prefixIcon:  Icon(Icons.attach_money,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  color:pro.isDark?  AllWhite :KAllBlack,
                  label: ' description',
                  controller: descriptionCont,
                  prefixIcon:  Icon(Icons.description_outlined ,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  color:  pro.isDark?  AllWhite :KAllBlack,
                  label: ' Link of image',
                  controller: imgUrlCont,
                  prefixIcon:  Icon(Icons.image_outlined,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  color: pro.isDark?  AllWhite :KAllBlack,

                  label: 'Neural',
                  controller: NeuralCont,
                  prefixIcon:  Icon(Icons.mood,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 15,
              ),
              DefaultTTF(
                  color: pro.isDark?  AllWhite :KAllBlack,

                  label: 'Negative',
                  controller: NegativeCont,
                  prefixIcon:  Icon(Icons.mood_bad_sharp,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 15,
              ),
              DefaultTTF(
                  color: pro.isDark?  AllWhite :KAllBlack,
                  label: 'Postive',
                  controller: PostiveCont,
                  prefixIcon:  Icon(Icons.mood_outlined,color: pro.isDark?  AllWhite :KAllBlack,)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                color:pro.isDark?  AllWhite :KAllBlack,
                label: 'selectedCategory',
                controller: selectedcont,
                prefixIcon:  Icon(Icons.turned_in_outlined,color: pro.isDark?  AllWhite :KAllBlack,),
                suffixIcon: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  value: selectedCategory,
                  dropdownColor: Colors.blueGrey,
                  items: categoryList
                      .map<DropdownMenuItem<String>>((String e) =>
                      DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                      selectedcont.text = value.toString();
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    widget.item== null?
                    bloc.addNewItem(
                        Category: selectedCategory,
                        productTitle: titleCont.text,
                        price: int.parse(priceCont.text),
                        Negative:int.parse( NegativeCont.text),
                        Positive:int.parse( PostiveCont.text),
                        Neutral: int.parse(NeuralCont.text),
                        imgUrl: imgUrlCont.text,
                        cat_id: getNumberFromString(selectedCategory),context: context)
                        :
                    bloc.upDateItem(
                      item: widget.item!,
                        Category: selectedCategory,
                        productTitle: titleCont.text,
                        price: int.parse(priceCont.text),
                        Negative:int.parse( NegativeCont.text),
                        Positive:int.parse( PostiveCont.text),
                        Neutral: int.parse(NeuralCont.text),
                        imgUrl: imgUrlCont.text,
                        cat_id: getNumberFromString(selectedCategory),context: context, id: widget.item!.iD!);

                  }
                },
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: KColor, borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                        widget.item== null?'Add Product':'Edit Product',
                    style: TextStyle(
                        color: AllWhite,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

int getNumberFromString(String name) {
  switch (name) {
    case 'Copen':
      return 1;
    case 'Heads':
      return 2;
    case 'Jtool':
      return 3;
    case 'Laptops':
      return 4;
    case 'Notebook':
      return 5;
    case 'Phones':
      return 6;
    default:
      return 1;
  }
}
