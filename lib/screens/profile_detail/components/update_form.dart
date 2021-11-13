import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_surfix_icon.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/components/form_error.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/helper/keyboard.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/services/user_service.dart';
// import 'package:online_shop_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class UpdateForm extends StatefulWidget {
  final UserUpdate currentUserUpdate;
  const UpdateForm({Key? key, required this.currentUserUpdate})
      : super(key: key);
  @override
  _UpdateFormState createState() => _UpdateFormState(this.currentUserUpdate);
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  final List<String?> errors = [];
  String? phoneNumber;
  String? fullname;
  String? email;
  String? address;

  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;

  _UpdateFormState(UserUpdate currentUserUpdate) {
    this._userUpdate = currentUserUpdate;
    // fullname = _userUpdate.fullName;
    // email = _userUpdate.email;
    // phoneNumber = _userUpdate.phoneNumber;
    // address = _userUpdate.address;
    _fullNameController =
        TextEditingController(text: "${_userUpdate.fullName}");
    _emailController = TextEditingController(text: "${_userUpdate.email}");
    _phoneNumberController =
        TextEditingController(text: "${_userUpdate.phoneNumber}");
    _addressController = TextEditingController(text: "${_userUpdate.address}");
  }
  late UserUpdate _userUpdate;

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
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
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Cập nhật",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  UserUpdate userUpdate = UserUpdate(
                    email: _emailController.text,
                    phoneNumber: _phoneNumberController.text,
                    fullName: _fullNameController.text,
                    address: _addressController.text,
                  );
                  UserService userService = UserService();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    var responseCode = await userService.UpdateUser(userUpdate);
                    if (responseCode == 200) {
                      Navigator.pop(context);
                      displayDialog(
                        context,
                        "Message",
                        "Update user Successfully!",
                      );
                    } else {
                      displayDialog(
                        context,
                        "An Error Occurred",
                        "Failed update user!",
                      );
                    }
                  }
                }
              },
            ),
          ],
        ),
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
        } else if (emailValidatorRegExp.hasMatch(value)) {
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

  TextFormField buildFullNameFormField() {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },

      controller: _fullNameController,
      style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Họ và tên",
        hintText: "Nhập họ và tên",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      controller: _addressController,
      style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Địa chỉ",
        hintText: "Nhập Địa chỉ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pin.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }
}
