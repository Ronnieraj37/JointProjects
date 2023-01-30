import 'package:flutter/material.dart';
import 'package:iiitdm/providers/branches.dart';
import 'package:iiitdm/screens/book_screen.dart';
import 'package:provider/provider.dart';
import './screens/semester_screen.dart';
import './screens/home_screen.dart';
import './screens/branch_screen.dart';

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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          "/": (context) =>  HomeScreen(),
          BookScreen.routeName: (context) => const BookScreen(),
          BranchScreen.routeName: (context) => BranchScreen(),
          SemesterScreen.routeName:(context) => SemesterScreen(),
        },
      ),
    );
  }
}
