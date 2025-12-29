import 'package:flutter/material.dart';

import 'core/utils/app_toast.dart';

class HomeTextPage extends StatelessWidget {
  const HomeTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppToast.show(
              context,
              message: 'This is a text toast',
              type: ToastType.success,
            );
          },
          child: Text('Show Toast'),
        ),
      ),
    );
  }
}
