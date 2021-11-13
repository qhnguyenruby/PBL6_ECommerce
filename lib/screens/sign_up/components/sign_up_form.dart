import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/components/custom_surfix_icon.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/components/form_error.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/helper/keyboard.dart';
import 'package:online_shop_app/models/RegisterRequest.dart';
import 'package:online_shop_app/services/account_service.dart';
// import 'package:online_shop_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? phoneNumber;
  String? fullName;
  String? email;
  String? address;
  String? password;
  String? confirm_password;
  bool remember = false;
  final List<String?> errors = [];
  bool _isObscurePassword = true;
  bool _isObscureComfirmPassword = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          buildConfirmPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "ĐĂNG KÝ",
            press: () async {
              RegisterRequest registerRequest = RegisterRequest(
                username: _usernameController.text,
                password: _passwordController.text,
                email: _emailController.text,
                phoneNumber: _phoneNumberController.text,
                fullName: _fullNameController.text,
                address: _addressController.text,
              );
              AccountService accountService = AccountService();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                var responseCode =
                    await accountService.Register(registerRequest);
                if (responseCode == 200) {
                  Navigator.pop(context);
                  displayDialog(
                    context,
                    "Message",
                    "Register Successfully!",
                  );
                } else {
                  displayDialog(
                    context,
                    "An Error Occurred",
                    "Failed register!",
                  );
                }
              }
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   RegisterRequest registerRequest = RegisterRequest(
              //     username: _usernameController.text,
              //     password: _passwordController.text,
              //     email: _emailController.text,
              //     phoneNumber: _phoneNumberController.text,
              //     fullName: _fullNameController.text,
              //     address: _addressController.text,
              //   );
              //   AccountService accountService = AccountService();
              //   if (_formKey.currentState!.validate()) {
              //     _formKey.currentState!.save();
              //     KeyboardUtil.hideKeyboard(context);
              //     var responseCode =
              //         await accountService.Register(registerRequest);
              //     if (responseCode == 200) {
              //       Navigator.pop(context);
              //       displayDialog(
              //         context,
              //         "Message",
              //         "Register Successfully!",
              //       );
              //     } else {
              //       displayDialog(
              //         context,
              //         "An Error Occurred",
              //         "Failed register!",
              //       );
              //     }
              //   }
              // }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _isObscureComfirmPassword,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kConfirmPassNullError);
        }
        if (value.isNotEmpty && (password == value)) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kConfirmPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Xác nhập mật khẩu",
        hintText: "Nhập lại mật khẩu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
            padding: EdgeInsets.fromLTRB(
              0,
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
            ),
            icon: SvgPicture.asset(
              _isObscureComfirmPassword
                  ? "assets/icons/visible.svg"
                  : "assets/icons/invisible.svg",
              height: getProportionateScreenWidth(18),
            ),
            onPressed: () {
              setState(() {
                _isObscureComfirmPassword = !_isObscureComfirmPassword;
              });
            }),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscurePassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu",
        hintText: "Nhập mật khẩu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
            padding: EdgeInsets.fromLTRB(
              0,
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
            ),
            icon: SvgPicture.asset(
              _isObscurePassword
                  ? "assets/icons/visible.svg"
                  : "assets/icons/invisible.svg",
              height: getProportionateScreenWidth(18),
            ),
            onPressed: () {
              setState(() {
                _isObscurePassword = !_isObscurePassword;
              });
            }),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Nhập email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _addressController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Địa chỉ",
        hintText: "Nhập địa chỉ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pin.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUsernameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kUsernameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Tên đăng nhập",
        hintText: "Nhập tên đăng nhập",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      controller: _fullNameController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kFullNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kFullNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Họ và tên",
        hintText: "Nhập họ và tên",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        if (phoneNumberValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidPhoneNumberError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (!phoneNumberValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }
}
