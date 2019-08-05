import 'dart:convert';

void main() {
  String jsonString =
      "{\"name\": \"John Smith\",\"email\": \"john@example.com\"}";
  Map<String, dynamic> user = jsonDecode(jsonString);

  print('Howdy, ${user['name']}!');
  print('We sent the verification link to ${user['email']}.');
}
