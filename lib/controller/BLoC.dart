import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/model/Item.dart';
import 'package:prd/model/user.dart';
import 'package:rxdart/rxdart.dart';

import '../view/widgets/loading_ind.dart';
String api = 'http://10.0.2.2:8000';

class BLoC {
  final _ItemSubject = new BehaviorSubject<List<Item>>();

  Stream<List<Item>> get Itemz => _ItemSubject.stream;
  List<Item> item = [];

  Future<void> login(String email, String password, context) async {
    showLoadingDialog(context);
    try {
      Response response = await post(Uri.parse("$api/api/auth/login"), body: {'email': email, 'password': password});
      print(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        user = UserData.fromJson(data);
        await getHomeData().then((value) =>Navigator.pushNamedAndRemoveUntil(context, '/layout', (route) => false)
        );
      } else {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('Please check your email or password'),
              title: Text('Error'),
            ));
      }
    } catch (e) {
      print(e);
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Error in network. Please try again later.'),
            title: Text('Network Error'),
          ));
    } finally {
      Navigator.pop(context);
    }
  }

  Future<void> register(
      String name, String email, String password, String phone, context) async {
    showLoadingDialog(context);

    Response response =
        await post(Uri.parse("$api/api/auth/register"), body: {
      'id': Random().nextInt(1000).toString(),
      'username': name,
      'password': password,
      'email': email,
      'phone': phone
    });
    print(response.body);

    if (response.statusCode == 201) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('you had registered successfully'),
                title: Text('Thanks'),
              ));
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Please check your data'),
                title: Text('Error'),
              ));
    }
  }

  Future<void> logOut(context) async {
    await post(Uri.parse("$api/api/auth/logout"), headers: {"Authorization": "Bearer ${user.accessToken}"});
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<void> getHomeData() async {
    Response response = await get(
        Uri.parse("$api/api/AllCategories"),
        headers: {"Authorization": "Bearer ${user.accessToken}"});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> _Temp = data['data'];
      item = _Temp.map((e) => Item.fromJson(e)).toList();
      print(item.first);
      _ItemSubject.add(item);
    }
  }

  Future<void> addNewItem({
    required String Category,
    required String productTitle,
    required int price,
    required int Negative,
    required int Positive,
    required int Neutral,
    String imgUrl =
        'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg',
    required int cat_id,
    required context,
  }) async {
    Response response = await post(
      Uri.parse("$api/api/CategoriesInsertion"),
      body: {
        'id': Random().nextInt(100000).toString(),
        'Category': Category,
        'productTitle': productTitle,
        'Price': price.toString(),
        'ProductRate': '3',
        'countryOfOrigin': 'unKnown',
        'Manufacturer': 'unknow',
        'ReviewsNumber': (Neutral + Positive + Negative).toString(),
        'Neutral': Neutral.toString(),
        'Positive': Positive.toString(),
        'Negative': Negative.toString(),
        'cat_id': cat_id.toString(),
        'image': imgUrl,
      },
      headers: {
        "Authorization": "Bearer ${user.accessToken}",
      },
    );
    print(response.body);
    if (response.statusCode == 201) {
      getHomeData();
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(
                  'Item Added Successful',
                  style: TextStyle(color: KColor),
                ),
                title: Text('Done :)'),
              ));
      Navigator.pop(context);
    }
  }

  Future<void> deleteItem(ID, context) async {
    Response response = await post(
        Uri.parse("$api/api/Categoriesdelete"),
        body: {'ID':ID.toString()},
        headers: {"Authorization": "Bearer ${user.accessToken}"});
    print(response.body);
    if (response.statusCode == 200) {
      getHomeData();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
    }
  }


  Future<void> upDateItem({
    required Item item,
    required int id,
    required String Category,
    required String productTitle,
    required int price,
    required int Negative,
    required int Positive,
    required int Neutral,
    String imgUrl =
    'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg',
    required int cat_id,
    required context,
  }) async {
    Response response = await post(
      Uri.parse("$api/api/Categoriesupdate$id"),
      body: {
        'ID':id.toString(),
        'Category': Category,
        'productTitle': productTitle,
        'Price': price.toString(),
        'ProductRate': item.productRate.toString(),
        'countryOfOrigin': item.countryOfOrigin.toString(),
        'Manufacturer': item.manufacturer.toString(),
        'ReviewsNumber': (Neutral + Positive + Negative).toString(),
        'Neutral': Neutral.toString(),
        'Positive': Positive.toString(),
        'Negative': Negative.toString(),
        'cat_id': cat_id.toString(),
        'image': imgUrl,
      },
      headers: {
        "Authorization": "Bearer ${user.accessToken}",
      },
    );
    print(response.body);
    print(id);
    if (response.statusCode == 201) {

      getHomeData();
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              'Item updated Successful',
              style: TextStyle(color: KColor),
            ),
            title: Text('Done :)'),
          ));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
    }
  }

}

extension on BehaviorSubject {
  kill() {
    this.sink;
    this.close();
    this.drain();
  }
}
