class TokenStorage {
  String token;

  TokenStorage({
    required this.token,
  });

  // now create converter

  factory TokenStorage.fromJson(Map<String, dynamic> responseData) {
    return TokenStorage(
      token: responseData['resultObj'],
    );
  }
}
