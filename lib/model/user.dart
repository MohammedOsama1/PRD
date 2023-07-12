class UserData {
  String? accessToken;
  String? name;
  String? email;
  int? id;
  String? userType;

  UserData({this.accessToken, this.name, this.email, this.id, this.userType});

  UserData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    name = json['name'];
    email = json['email'];
    id = json['id'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    data['userType'] = this.userType;
    return data;
  }
}