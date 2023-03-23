import 'package:flutter/material.dart';

class GlobalMethods {
  Future<void> showDialogue(BuildContext context, VoidCallback callback) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('All items will be deleted!'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            TextButton(
                onPressed: () {
                  callback();
                  Navigator.pop(context);
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }

  Future<void> authDialog(BuildContext context, String subTitle) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error Occured'),
          content: Text(subTitle),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay')),
          ],
        );
      },
    );
  }
}
