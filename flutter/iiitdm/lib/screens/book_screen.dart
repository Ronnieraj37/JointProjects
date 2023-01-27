import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:iiitdm/widgets/book_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:drop_down_list/drop_down_list.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool isDarkModeEnabled = false;
  List<String> courses = ["Computer Science","Electronics","Mechanical","Smart Manufacturing"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Screen',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkModeEnabled
              ? const Color(0xFF253341)
              : const Color.fromARGB(255, 22, 85, 195),
          title: const Text("Book Screen"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25,
            ).px8(),
          ),
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
                ).h(46).w(88).px16(),
              ],
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         const Icon(Icons.arrow_back_ios_new_rounded).p0(),
        //         "Edit Course".text.make(),
        //       ],
        //     )).w(120).h(100),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors: isDarkModeEnabled ?
                 const [Color(0x0048FFFF),Color(0xFF253341)]: const [Color(
                     0xD545F3E4),Colors.white],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
             ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: isDarkModeEnabled
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 51, 61, 58),
                              Color.fromARGB(255, 0, 113, 109)
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 113, 132, 244),
                              Color.fromARGB(255, 35, 101, 243)
                            ],
                          )),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                EvaIcons.options,
                                color: isDarkModeEnabled
                                    ? Colors.redAccent
                                    : Colors.greenAccent,
                              ).px8(),
                              "Edit Course"
                                  .text
                                  .color(isDarkModeEnabled
                                      ? Colors.redAccent
                                      : Colors.greenAccent)
                                  .make(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Computer Science"
                                  .text
                                  .xl
                                  .color(isDarkModeEnabled
                                      ? Colors.lightBlueAccent
                                      : const Color.fromARGB(255, 239, 248, 142))
                              .extraBold
                                  .make(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               const BookView(),
      // DropDownState(
      //   DropDown(
      //     bottomSheetTitle: const Text(
      //       "kCities",
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20.0,
      //       ),
      //     ),
      //     submitButtonChild: const Text(
      //       'Done',
      //       style: TextStyle(
      //         fontSize: 16,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     data: courses,
      //     selectedItems: (List<dynamic> selectedList) {
      //       List<String> list = [];
      //       for(var item in selectedList) {
      //         if(item is SelectedListItem) {
      //           list.add(item.name);
      //         }
      //       }
      //       showSnackBar(list.toString());
      //     },
      //     enableMultipleSelection: true,
      //   ),
      // ).showModal(context);
            ],
          ),
        ),
      ),
    );
  }
}
