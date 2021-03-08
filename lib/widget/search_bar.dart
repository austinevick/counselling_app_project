import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 5,
          child: Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search)),
              ))),
    );
  }
}
