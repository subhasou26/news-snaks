import 'package:flutter/material.dart';

class SearchBarT extends StatelessWidget {
  const SearchBarT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25)
      ),
      child: TextField(


      ),
    );
  }
}
