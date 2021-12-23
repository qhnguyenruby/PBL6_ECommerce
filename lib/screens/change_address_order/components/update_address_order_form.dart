import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_surfix_icon.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/components/form_error.dart';
import 'package:online_shop_app/helper/keyboard.dart';
import 'package:online_shop_app/models/AddressOrderUpdate.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/services/user_service.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class UpdateAddressOrderForm extends StatefulWidget {
  const UpdateAddressOrderForm({
    Key? key,
    required this.functionUpdateAddress,
    required this.addressOrderUpdate,
  }) : super(key: key);

  final functionUpdateAddress;
  final AddressOrderUpdate addressOrderUpdate;
  @override
  _UpdateAddressOrderFormState createState() =>
      _UpdateAddressOrderFormState(this.addressOrderUpdate);
}

class _UpdateAddressOrderFormState extends State<UpdateAddressOrderForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? phoneNumber;
  String? fullname;
  String? address;

  _UpdateAddressOrderFormState(AddressOrderUpdate addressOrderUpdate) {
    this._addressOrderUpdate = addressOrderUpdate;
    _fullNameController =
        TextEditingController(text: "${_addressOrderUpdate.fullName}");
    _phoneNumberController =
        TextEditingController(text: "${_addressOrderUpdate.phoneNumber}");
    _addressController =
        TextEditingController(text: "${_addressOrderUpdate.address}");
  }
  late AddressOrderUpdate _addressOrderUpdate;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildFullNameFormField(),
              SizedBox(height: getProportionateScreenHeight(12)),
              buildPhoneNumberFormField(),
              SizedBox(height: getProportionateScreenHeight(12)),
              buildAddressFormField(),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                text: "Tiếp tục",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    AddressOrderUpdate addressUpdate = AddressOrderUpdate(
                      phoneNumber: _phoneNumberController.text,
                      fullName: _fullNameController.text,
                      address: _addressController.text,
                    );

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      KeyboardUtil.hideKeyboard(context);
                      widget.functionUpdateAddress(addressUpdate);
                      Navigator.pop(context, addressUpdate);
                      // final action = await Dialogs.yesAbortDialog(
                      //   context,
                      //   'Thông báo',
                      //   'Bạn có chắc muốn đăng xuất tài khoản này!',
                      // );
                      // if (action == DialogAction.yes) {
                      //   Navigator.pop(context, addressUpdate);
                      // }
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  TextFormField buildFullNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => fullname = newValue,
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
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (phoneNumberValidatorRegExp.hasMatch(value)) {
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
