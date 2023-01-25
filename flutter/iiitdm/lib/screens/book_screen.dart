import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled = false;
    return MaterialApp(
      title: 'Books Screen',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Book Screen"),
          actions: [
            Row(
              children: [
                DayNightSwitcher(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: (value) {
                    setState(() {
                      isDarkModeEnabled = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        //floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        //   child: ,
        // ),
        body: Container(),
      ),
    );
  }
}
