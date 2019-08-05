import 'dart:convert';

void main() {
  Map testMap = jsonDecode(jsonString);
  UserInfo userInfo = UserInfo.fromJson(testMap);
  print('name = ${userInfo.name}');
  print('age = ${userInfo.age}');
  print('gender = ${userInfo.gender}');
  print('degree = ${userInfo.degree}');
  print('married = ${userInfo.married}');
  print(jsonEncode(userInfo));
}

String jsonString =
    "{\"name\":\"103style\",\"age\":25,\"gender\":1,\"degree\":\"bachelor\",\"married\":false}";

class UserInfo {
  String name;
  int age;
  int gender;
  String degree;
  bool married;

  UserInfo(this.name, this.age, this.gender, this.degree, this.married);

  UserInfo.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    age = map['age'];
    gender = map['gender'];
    married = map['married'];
    degree = map['degree'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'degree': degree,
      'married': married,
    };
  }
}
