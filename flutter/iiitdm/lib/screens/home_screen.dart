import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iiitdm/providers/branches.dart';
import 'package:iiitdm/screens/book_screen.dart';
import 'package:iiitdm/screens/branch_screen.dart';
import 'package:iiitdm/screens/semester_screen.dart';
import 'package:provider/provider.dart';
import '../utilityWidgets/expandable_list.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final branches = Provider.of<Branches>(context, listen: false).branches;
    final semesters = Provider.of<Semesters>(context, listen: false).semesters;

    Map<String, String> branchesById = {};
    branches.forEach((branch) {
      branchesById[branch.id] = branch.title;
    });

    Map<String, String> semestersById = {};
    semesters.forEach((semester) {
      semestersById[semester.id] = semester.title;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 85, 195),
        title: const Text("IIITDM"),
      ),
      body: ListView(children: [
        ExpandableList('Branches', branchesById, BookScreen.routeName),
        ExpandableList('Semesters', semestersById, SemesterScreen.routeName),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('bookScreen'),
            child: Text('Book Screen'))
      ]),
    );
  }
}
