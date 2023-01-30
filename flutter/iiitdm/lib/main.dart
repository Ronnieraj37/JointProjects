import 'package:flutter/material.dart';
import 'package:iiitdm/providers/branches.dart';
import 'package:iiitdm/providers/courses.dart';
import 'package:iiitdm/screens/course_list_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Branches()),
        ChangeNotifierProvider.value(value: Semesters()),
        ChangeNotifierProvider.value(value: Courses()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          "/": (context) => HomeScreen(),
          CourseListScreen.routeName: (context) => const CourseListScreen(),
        },
      ),
    );
  }
}
