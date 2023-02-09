import 'package:flutter/material.dart';

enum CourseType {
  bsc,
  sec,
  bec,
  dsc,
  itc,
  pcc,
  pec,
  elc,
  hsc,
  pcd;
}

class Course {
  final String id;
  final String title;
  //faculty
  //book Ids
  final List<String> semIds;
  final CourseType courseType;
  final double credits;
  // final String syllabus;
  // final List<String> resources;
  //difficulty
  //review
  //comments
  //description

  Course({
    required this.id,
    required this.courseType,
    required this.title,
    required this.credits,
    required this.semIds,
  });
}

class Courses with ChangeNotifier {
  List<Course> _courses = [
    Course(
        id: 'cal',
        title: 'Calculus',
        credits: 4,
        courseType: CourseType.bsc,
        semIds: ['1']),
    Course(
        id: 'ee',
        title: 'Engineering Electromagnetics',
        credits: 3,
        courseType: CourseType.bsc,
        semIds: ['1']),
    Course(
        id: 'ece',
        title: 'Electrical Circuits for Engineers',
        credits: 4,
        courseType: CourseType.bec,
        semIds: ['1']),
    Course(
        id: 'psp',
        title: 'Problem Solving and Programming',
        credits: 3,
        courseType: CourseType.bec,
        semIds: ['1']),
    Course(
        id: 'mfe',
        title: 'Materials for Engineers',
        credits: 3,
        courseType: CourseType.bec,
        semIds: ['1']),
    Course(
        id: 'fepd',
        title: 'Foundation for Engineering and Product Design',
        credits: 3,
        courseType: CourseType.dsc,
        semIds: ['1']),
    Course(
        id: 'eep',
        title: 'Engineering Electromagnetics Practice',
        credits: 1.5,
        courseType: CourseType.bsc,
        semIds: ['1']),
    Course(
        id: 'pspp',
        title: 'Problem Solving and Programming Practice',
        credits: 1.5,
        courseType: CourseType.bec,
        semIds: ['1']),
    Course(
        id: 'elcs',
        title: 'Effective Language and Communication Skills',
        credits: 2,
        courseType: CourseType.hsc,
        semIds: ['1']),
  ];

  List<Course> get courses {
    return [..._courses];
  }

  List<Course> coursesBySemId(String semId) {
    List<Course> cr = [];
    for (int i = 0; i < _courses.length; i++) {
      if (_courses[i].semIds[0] == semId) {
        cr.add(_courses[i]);
      }
    }
    return cr;
  }
}
