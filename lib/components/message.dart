import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  const Message({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message),
        ],
      ),
    );
  }
}
