
import 'package:flutter/material.dart';
import 'package:prd/view/theme.dart';
import 'package:prd/view/widgets/txtFF.dart';

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
    return Scaffold(
      appBar: AppBar(
        title:Text('Add new item',),
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
                  Icon(Icons.admin_panel_settings_outlined,size: 200,color: KColor,),
                  SizedBox(height: 30,),
                  DefaultTTF(label:' title',controller: titleCont, prefixIcon: const Icon(Icons.title)),
                  SizedBox(height: 15,),
                  DefaultTTF(label:' price',controller: priceCont , prefixIcon: const Icon(Icons.attach_money)),
                  SizedBox(height: 15,),
                  DefaultTTF(label:' description',controller:descriptionCont, prefixIcon: const Icon(Icons.description_outlined)),
                  SizedBox(height: 15,),
                  DefaultTTF(label:' Link of image',controller: imgUrlCont, prefixIcon: const Icon(Icons.image_outlined)),
                  SizedBox(height: 15,),
                  DefaultTTF(label:' selectedCategory',controller: selectedcont, prefixIcon: const Icon(Icons.turned_in_outlined), suffixIcon: DropdownButton(
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
                          color: KColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                            'Add Product',
                            style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
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

