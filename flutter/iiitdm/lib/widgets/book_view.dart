import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){},
          title: "Semester ${index+1}".text.xl.make(),
          //leading: ,
          trailing: const Icon(Icons.arrow_downward_rounded),
        );
      },
    );
  }
}
