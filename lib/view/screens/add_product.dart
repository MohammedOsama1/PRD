import 'package:flutter/material.dart';
import 'package:prd/model/Item.dart';
import 'package:prd/view/theme.dart';
import 'package:prd/view/widgets/txtFF.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item== null?'Add New Product':'Edit Product',
        ),
        backgroundColor: KColor,
      ),
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
                  label: ' title',
                  controller: titleCont,
                  prefixIcon: const Icon(Icons.title)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  label: 'price',
                  controller: priceCont,
                  prefixIcon: const Icon(Icons.attach_money)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  label: ' description',
                  controller: descriptionCont,
                  prefixIcon: const Icon(Icons.description_outlined)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  label: ' Link of image',
                  controller: imgUrlCont,
                  prefixIcon: const Icon(Icons.image_outlined)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                  label: 'Neural',
                  controller: NeuralCont,
                  prefixIcon: const Icon(Icons.mood)),
              SizedBox(
                height: 15,
              ),
              DefaultTTF(
                  label: 'Negative',
                  controller: NegativeCont,
                  prefixIcon: const Icon(Icons.mood_bad_sharp)),
              SizedBox(
                height: 15,
              ),
              DefaultTTF(
                  label: 'Postive',
                  controller: PostiveCont,
                  prefixIcon: const Icon(Icons.mood_outlined)),
              SizedBox(
                height: 25,
              ),
              DefaultTTF(
                label: 'selectedCategory',
                controller: selectedcont,
                prefixIcon: const Icon(Icons.turned_in_outlined),
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
                        color: Colors.white,
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
