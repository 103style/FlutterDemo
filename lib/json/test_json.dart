import 'dart:convert';

void main() {
  Attach attach = new Attach(1, "bachelor", false);
  UserInfo userInfo = new UserInfo('103style', 24, attach);

  String s = jsonEncode(userInfo);
  print(s);
  Map<String, dynamic> map = jsonDecode(s);
  UserInfo u = UserInfo.fromJson(map);
  print('name = ${u.name}');
  print('age = ${u.age}');
  print('gender = ${u.attach.gender}');
  print('degree = ${u.attach.degree}');
  print('married = ${u.attach.married}');
}

class UserInfo {
  String name;
  int age;
  Attach attach;

  UserInfo(this.name, this.age, this.attach);

  UserInfo.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    age = map['age'];
    attach = Attach.fromJson(map['attach']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'attach': attach.toJson(),
    };
  }
}

class Attach {
  int gender;
  String degree;
  bool married;

  Attach(this.gender, this.degree, this.married);

  Attach.fromJson(Map<String, dynamic> map) {
    gender = map['gender'];
    married = map['married'];
    degree = map['degree'];
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'degree': degree,
      'married': married,
    };
  }
}
