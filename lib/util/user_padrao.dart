import 'package:flutter/material.dart';

Container userPadrao(IconData iconPersonalizado) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20)),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 15),
          borderRadius: BorderRadius.circular(70)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconPersonalizado,
          size: 90,
        ),
      ),
    ),
  );
}
