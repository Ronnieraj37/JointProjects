import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BranchScreen extends StatelessWidget {
  BranchScreen({
    super.key,
  });
  static const routeName = '/branchScreen';

  final Map<String, String> branchById = {
    'cs': 'Computer Science',
    'csai': 'Computer Science Artificial Intelligence',
    'ece': 'Electronics and Communication',
    'mech': 'Mechanical',
    'sm': 'Smart Manufacturing'
  };

  @override
  Widget build(BuildContext context) {
    final String selectedBranchId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('IIITDM')),
      body: Column(children: [
        Container(margin: EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: Text(branchById[selectedBranchId] as String, style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
        ),),)
      ]),
    );
  }
}
