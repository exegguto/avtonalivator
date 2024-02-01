import 'package:flutter/material.dart';

class DialogHelper {
  static void showCustomDialog(
      BuildContext context, {
        required String title,
        String hintText = "",
        required Function(String) onConfirm,
        Function()? onCancel,
      }) {
    String inputText = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (value) {
              inputText = value;
            },
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: <Widget>[
            if (onCancel != null)
              TextButton(
                child: Text('Отмена'),
                onPressed: () {
                  onCancel();
                  Navigator.of(context).pop();
                },
              ),
            TextButton(
              child: Text('Сохранить'),
              onPressed: () {
                onConfirm(inputText);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
