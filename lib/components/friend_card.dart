import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/entity/friend.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;

  const FriendCard({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("id: ${friend.id}");
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                friend.avatar,
                width: 70,
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(friend.user),
                    Text(friend.name),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
