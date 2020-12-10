import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(30, 2, 5, 5),
  filled: true,
  fillColor: Colors.white,
  hintText: "Search By Name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(25.0),
        right: Radius.circular(25.0),
      )),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(25.0),
        right: Radius.circular(25.0),
      )),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2.0),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(25.0),
        right: Radius.circular(25.0),
      )),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2.0),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(24.0),
        right: Radius.circular(24.0),
      )),
);
