class RegisterRequest {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String username;
  final String password;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.username,
    required this.password,
  });
}
