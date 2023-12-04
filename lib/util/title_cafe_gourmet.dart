import 'package:flutter/material.dart';

Row titleCafeGourmet() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "CAFÉ GOURMET SP",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 20,
      ),
      Image(
        image: AssetImage("lib/assets/appstore.png"),
        width: 25,
        height: 25,
      ),
      // Icon(
      //   Icons.map,
      //   size: 32,
      // )
    ],
  );
}
