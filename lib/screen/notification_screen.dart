import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route='/notification-screen';

  @override
  Widget build(BuildContext context) {
    final message=ModalRoute.of(context)!.settings.arguments;
    return Center(child: Text("Notification Screen ${message}"),);
  }
}
