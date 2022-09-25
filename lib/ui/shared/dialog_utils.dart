import 'package:flutter/material.dart';

Future<bool?> showComfirmDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: const Text('Are u sure?'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text('No')),
              TextButton(
                onPressed: (() {
                  Navigator.of(context).pop(true);
                }),
                child: const Text('Yes'),
              )
            ],
          ));
}