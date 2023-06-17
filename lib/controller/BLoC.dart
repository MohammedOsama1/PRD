import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/model/Item.dart';
import 'package:prd/model/user.dart';
import 'package:rxdart/rxdart.dart';

class BLoC {
  final _ItemSubject = new BehaviorSubject<List<Item>>();

  Stream<List<Item>> get Itemz => _ItemSubject.stream;
  List<Item> item = [];

  Future<void> login(String email, String password, context) async {
    Response response = await post(
        Uri.parse("http://127.0.0.1:8000/api/auth/login"),
        body: {'email': email, 'password': password});
    print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      user = UserData.fromJson(data);
      await getHomeData();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LayoutScreen()), (route) => false);
    } else {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Please check your email or password'),
                title: Text('Error'),
              ));
    }
  }

  Future<void> register(
      String name, String email, String password, String phone, context) async {
    Response response =
        await post(Uri.parse("http://127.0.0.1:8000/api/auth/register"), body: {
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
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
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
    await post(Uri.parse("http://127.0.0.1:8000/api/auth/logout"),
        headers: {"Authorization": "Bearer ${user.accessToken}"});
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

  Future<void> getHomeData() async {
    Response response = await get(
        Uri.parse("http://127.0.0.1:8000/api/AllCategories"),
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
      Uri.parse("http://127.0.0.1:8000/api/CategoriesInsertion"),
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
        Uri.parse("http://127.0.0.1:8000/api/Categoriesdelete"),
        body: {'ID':ID.toString()},
        headers: {"Authorization": "Bearer ${user.accessToken}"});
    print(response.body);
    if (response.statusCode == 200) {
      getHomeData();
      Navigator.pop(context);
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
