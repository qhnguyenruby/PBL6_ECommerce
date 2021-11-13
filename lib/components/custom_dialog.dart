import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text('Hủy'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              child: const Text(
                'Đăng xuất',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: kPrimaryColor,
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
