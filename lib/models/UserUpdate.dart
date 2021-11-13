class UserUpdate {
  String fullName;
  String email;
  String phoneNumber;
  String address;

  // set FullName(String value) {
  //   fullName = value;
  // }

  // String get FullName => fullName;

  // set Email(String value) {
  //   email = value;
  // }

  // String get Email => email;

  // set PhoneNumber(String value) {
  //   phoneNumber = value;
  // }

  // String get PhoneNumber => phoneNumber;

  // set Address(String value) {
  //   address = value;
  // }

  // String get Address => address;

  UserUpdate({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory UserUpdate.fromJson(Map<String, dynamic> json) {
    return UserUpdate(
      fullName: json['resultObj']['fullname'],
      email: json['resultObj']['email'],
      phoneNumber: json['resultObj']['phoneNumber'],
      address: json['resultObj']['address'] != null
          ? json['resultObj']['address']
          : "",
    );
  }
}
