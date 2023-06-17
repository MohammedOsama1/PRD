import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/model/Item.dart';
import 'package:rxdart/rxdart.dart';

class BLoC {
  final _ItemSubject = new BehaviorSubject<List<Item>>();
  Stream<List<Item>> get Itemz => _ItemSubject.stream;
  List <Item> _item= [];

  String token = '';
  Future<void> login(String email, String password,context) async {
      Response response = await post(
          Uri.parse("http://127.0.0.1:8000/api/auth/login"),
          body: {'email': email, 'password': password});
      print(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        token = data ['access_token'];
        print(token);
        await getHomeData();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LayoutScreen()), (route) => false);
      }
      else {
      await  showDialog(context: context, builder: (context)=>AlertDialog(
          content: Text('Please check your email or password'),title: Text('Error'),
        ));

      }

  }
  Future<void> register(String name,String email, String password,String phone,context) async {
      Response response = await post(
          Uri.parse("http://127.0.0.1:8000/api/auth/register"),
          body: {'id':Random().nextInt(1000).toString(),'username': name, 'password': password , 'email':email,'phone':phone});
      print(response.body);

      if (response.statusCode == 201) {
        await  showDialog(context: context, builder: (context)=>AlertDialog(
          content: Text('you had registered successfully' ),title: Text('Thanks'),
        )
    );
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
      }
      else {
      await  showDialog(context: context, builder: (context)=>AlertDialog(
          content: Text('Please check your data'),title: Text('Error'),
        ));

      }

  }

  Future<void> getHomeData() async {

      Response response = await get(
          Uri.parse("http://127.0.0.1:8000/api/AllCategories"),headers: {"Authorization": "Bearer ${token}"});

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> _Temp = data['data'];
        _item = _Temp.map((e) => Item.fromJson(e)).toList();
        print(_item.first);
        _ItemSubject.add(_item);
        _ItemSubject.kill();
      }
      else {

      }

  }
}


extension  on BehaviorSubject {
  kill (){
    this.sink;
    this.close();
    this.drain();}}