import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Semester {
  final String id;
  final String title;

  Semester({required this.id, required this.title});
}

class Semesters with ChangeNotifier {
  final List<Semester> _semesters = [
    Semester(
      id: '1',
      title: 'Semester 1',
    ),
    Semester(
      id: '2',
      title: 'Semester 2',
    ),
    Semester(
      id: '3',
      title: 'Semester 3',
    ),
    Semester(
      id: '4',
      title: 'Semester 4',
    ),
    Semester(
      id: '5',
      title: 'Semester 5',
    ),
    Semester(
      id: '6',
      title: 'Semester 6',
    ),
    Semester(
      id: '7',
      title: 'Semester 7',
    ),
    Semester(
      id: '8',
      title: 'Semester 8',
    ),
    Semester(
      id: 'np',
      title: 'NPTEL',
    ),
  ];

  List<Semester> get semesters {
    return [..._semesters];
  }
}

class Branch {
  final String id;
  final String title;

  Branch({required this.id, required this.title});
}

class Branches with ChangeNotifier {
  final List<Branch> _branches = [
    Branch(id: 'cs', title: 'Computer Science'),
    Branch(id: 'csai', title: 'Computer Science Artificial Intelligence'),
    Branch(id: 'ece', title: 'Electronics and Communication'),
    Branch(id: 'mech', title: 'Mechanical Engineering'),
    Branch(id: 'sm', title: 'Smart Manufacturing'),
  ];

  List<Branch> get branches {
    return [..._branches];
  }
}
