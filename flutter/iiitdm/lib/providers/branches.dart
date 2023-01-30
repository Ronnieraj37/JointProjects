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
  final Map<String, List<String>> courseBySemId;

  Branch({required this.id, required this.title, required this.courseBySemId});
}

class Branches with ChangeNotifier {
  final List<Branch> _branches = [
    Branch(id: 'cs', title: 'Computer Science',
    courseBySemId: {'1': ['cal','ee','ece','psp','mfe','fepd','eep','pspp','elcs']}),

    Branch(id: 'csai', title: 'Computer Science Artificial Intelligence',
    courseBySemId: {'1': ['cal','ee','ece','psp','mfe','fepd','eep','pspp','elcs']}),

    Branch(id: 'ece', title: 'Electronics and Communication',
    courseBySemId: {'1': ['cal','ee','ece','psp','mfe','fepd','eep','pspp','elcs']}),

    Branch(id: 'mech', title: 'Mechanical Engineering',
    courseBySemId: {'1': ['cal','ee','ece','psp','mfe','fepd','eep','pspp','elcs']}),

    Branch(id: 'sm', title: 'Smart Manufacturing',
    courseBySemId: {'1': ['cal','ee','ece','psp','mfe','fepd','eep','pspp','elcs']}),
    
  ];

  List<Branch> get branches {
    return [..._branches];
  }
}
