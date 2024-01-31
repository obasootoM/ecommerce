import 'dart:convert';

class User {
  final String Id;
  final String Name;
  final String Email;
  final String Password;
  final String Address;
  final String Token;
  final String Type;
  final List<dynamic> cart;

  User(
      {
      required this.cart,
      required this.Id,
      required this.Name,
      required this.Email,
      required this.Password,
      required this.Address,
      required this.Token,
      required this.Type});

  Map<String, dynamic> toMap() {
    return {
      'id': Id,
      'name': Name,
      'email': Email,
      'password': Password,
      'address': Address,
      'token': Token,
      'type': Type,
      'cart': cart
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        Id: map['_id'] ?? '',
        Name: map['name'] ?? '',
        Email: map['email'] ?? '',
        Password: map['password'] ?? '',
        Address: map['address'] ?? '',
        Token: map['token'] ?? '',
        Type: map['type'] ?? '',
        cart: List<Map<String, dynamic>>.from(map['cart']?.map((x) => Map<String, dynamic>.from(x)))
        );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  

  

  User copyWith({
    String? Id,
    String? Name,
    String? Email,
    String? Password,
    String? Address,
    String? Token,
    String? Type,
    List<dynamic>? cart,
  }) {
    return User(
      Id:Id ?? this.Id,
      Name:Name ?? this.Name,
      Email:Email ?? this.Email,
      Password:Password ?? this.Password,
      Address: Address ?? this.Address,
      Token:Token ?? this.Token,
      Type:Type ?? this.Type,
      cart:cart ?? this.cart,
    );
  }
}
