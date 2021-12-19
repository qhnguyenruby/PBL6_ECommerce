import 'package:flutter/material.dart';
import 'package:online_shop_app/size_config.dart';

const kPrimaryColor = Color(0xfffea200);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

List categories = [
  {"label": 'Mới nhất', "arrayMappedname": 'lastest'},
  {"label": 'Phổ biến', "arrayMappedname": 'popular'},
  {"label": 'Giá thấp đến cao', "arrayMappedname": 'priceUp'},
  {"label": 'Giá cao đến thấp', "arrayMappedname": 'priceDown'},
];

List<Map<String, dynamic>> subCategories = [
  {
    "Áo": ["Áo Thun", "Áo Sơ mi", "Áo Hoodie", "Áo Khoác"],
    "idCate": [1, 2, 3, 12],
  },
  {
    "Quần": ["Quần Jean", "Quần Tây", "Quần Đùi"],
    "idCate": [4, 8, 9],
  },
  {
    "Đầm/váy": ["Váy", "Đầm"],
    "idCate": [6, 7],
  },
  {
    "Phụ kiện": ["Đồ lót", "Thắt Lưng", "Mũ/Nón"],
    "idCate": [5, 10, 11],
  },
];

const defaultDuration = Duration(milliseconds: 250);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]");
final RegExp phoneNumberValidatorRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
const String kEmailNullError = "Nhập vào email của bạn";
const String kInvalidEmailError = "Email không hợp lệ";
const String kPassNullError = "Nhập vào mật khẩu của bạn";
const String kConfirmPassNullError = "Xác nhận mật khẩu của bạn";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Xác nhận mật khẩu không đúng";
const String kUsernameNullError = "Nhập vào tên đăng nhập của bạn";
const String kFullNameNullError = "Nhập vào họ tên của bạn";
const String kPhoneNumberNullError = "Nhập vào số điện thoại của bạn";
const String kInvalidPhoneNumberError = "Số điện thoại không hợp lệ";
const String kAddressNullError = "Nhập vào địa chỉ của bạn";

// const SERVER_IP = "http://192.168.1.91:86";
const SERVER_IP = "http://c64e-2402-800-6205-3e19-cd35-9f68-4158-e6ba.ngrok.io";
