import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SemesterScreen extends StatelessWidget {
  SemesterScreen({super.key,});
  static const routeName = '/semesterScreen';

  final Map<String, String> semById = {
    '1': 'Semester 1',
    '2': 'Semester 2',
    '3': 'Semester 3',
    '4': 'Semester 4',
    '5': 'Semester 5',
    '6': 'Semester 6',
    '7': 'Semester 7',
    '8': 'Semester 8',
    'np': 'NPTEL'
  };

  @override
  Widget build(BuildContext context) {
    final String selectedSemId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('IIITDM')),
      body: Column(children: [
        Container(margin: EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: Text(semById[selectedSemId] as String, style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
        ),),)
      ]),
      
    );
  }
}
