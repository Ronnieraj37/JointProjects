import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
          );
        });
  }
}
