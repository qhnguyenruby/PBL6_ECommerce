import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.00,
      height: 100.00,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: ExactAssetImage('assets/images/Logo 2@2x.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
