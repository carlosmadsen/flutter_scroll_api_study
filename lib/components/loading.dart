import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {
  final bool big;
  const Loading({super.key, required this.big});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: big
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('Carregando ...'),
                ),
              ],
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Carregando. "),
                ),
              ],
            ),
    );
  }
}
