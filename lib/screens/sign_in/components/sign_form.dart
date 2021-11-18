import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/components/custom_surfix_icon.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/components/form_error.dart';
import 'package:online_shop_app/helper/keyboard.dart';
import 'package:online_shop_app/models/LoginRequest.dart';
import 'package:online_shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:online_shop_app/screens/profile/profile_screen.dart';
// import 'package:online_shop_app/screens/profile/profile_screen.dart';
import 'package:online_shop_app/screens/screen_controller/screen_controller.dart';
import 'package:online_shop_app/services/account_service.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  bool _isObscure = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  // void displayDialog(context, title, text) => showDialog(
  //       context: context,
  //       builder: (context) =>
  //           AlertDialog(title: Text(title), content: Text(text)),
  //     );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ForgotPasswordScreen.routeName,
                ),
                child: Text(
                  "Quên mật khẩu?",
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: getProportionateScreenWidth(10),
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              LoginRequest loginRequest = LoginRequest(
                username: _usernameController.text,
                password: _passwordController.text,
              );
              AccountService accountService = AccountService();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                var responseCode = await accountService.Login(loginRequest);
                if (responseCode == 200) {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                  displayDialog(
                    context,
                    "Message",
                    "Login Successfully!",
                  );
                } else {
                  displayDialog(
                    context,
                    "An Error Occurred",
                    "No account was found matching that username and password!",
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscure,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
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
              _isObscure
                  ? "assets/icons/visible.svg"
                  : "assets/icons/invisible.svg",
              height: getProportionateScreenWidth(18),
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
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
      controller: _usernameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelText: "Tên đăng nhập",
        hintText: "Nhập tên đăng nhập",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
