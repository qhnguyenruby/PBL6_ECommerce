class User {
  String fullName;
  String email;
  String phoneNumber;
  String address;
  bool disable;

  User({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.disable,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['resultObj']['fullname'],
      email: json['resultObj']['email'],
      phoneNumber: json['resultObj']['phoneNumber'],
      address: json['resultObj']['address'] != null
          ? json['resultObj']['address']
          : "",
      disable: json['resultObj']['disable'],
    );
  }
}
