import 'package:flutter/material.dart';
import 'package:onstore/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width  * (0.6),
                  height: 50,
                )
              ],
            ),
            Center(
              child: Text("Home Page Body"),
            )
          ],
        ),
      ),
    );
  }
}
