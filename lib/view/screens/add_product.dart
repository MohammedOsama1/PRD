
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);

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

  GlobalKey<FormState> formKey = GlobalKey();


  String selectedCategory = "electronics";

  List <String> categoryList = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTFF('- title',cont: titleCont),
              buildTFF('- price',cont: priceCont),
              buildTFF('- description',cont:descriptionCont),
              buildTFF('- Link of image',cont: imgUrlCont),
              buildTFF('- selectedCategory',cont: selectedcont, widget: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  value: selectedCategory,
                  dropdownColor: Colors.blueGrey,
                  items: categoryList
                      .map<DropdownMenuItem<String>>((String e) =>
                      DropdownMenuItem<String>(
                          value: e.toString(), child: Text(e.toString())))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  })),
              GestureDetector(
                onTap: (){
                  if(formKey.currentState!.validate()) {
                  }
                },
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                        'add Product',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ));
  }

  Padding buildTFF(txt,{widget,cont}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            txt,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  readOnly: widget==null ? false : true,
                  controller: cont,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'it can\'t be null';
                  //   }
                  // }

                  decoration: InputDecoration(
                    suffixIcon: widget,
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

