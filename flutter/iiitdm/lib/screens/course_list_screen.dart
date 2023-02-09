import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:iiitdm/providers/branches.dart';
import 'package:iiitdm/widgets/book_view.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:lottie/lottie.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});
  static const routeName = 'CourseListScreen';

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  bool isDarkModeEnabled = false;
  int index = 0;
  bool stopAnim = false;
  String? selectedBranchId = null;
  List<String> animations = [
    "https://assets6.lottiefiles.com/packages/lf20_iVPQC8jyX2.json",
    "https://assets6.lottiefiles.com/packages/lf20_iVPQC8jyX2.json",
    "https://assets2.lottiefiles.com/packages/lf20_4kmUDEKo63.json",
    "https://assets9.lottiefiles.com/packages/lf20_Wul2a03BPx.json",
    "https://assets7.lottiefiles.com/packages/lf20_8CWmbWg5Pl.json"
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          stopAnim = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selectedBranchId == null)
      selectedBranchId = ModalRoute.of(context)!.settings.arguments as String;

    final branchesProvider = Provider.of<Branches>(context);
    // final branches =
    //     branchesProvider.branches.map((branch) => branch.title).toList();
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
            onPressed: () {
              Navigator.pop(context);
            },
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkModeEnabled
                  ? const [Color(0x0048FFFF), Color(0xFF253341)]
                  : const [Color(0xD545F3E4), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: stopAnim
              ? Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showMaterialModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 350,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children:
                                      branchesProvider.branches.map((branch) {
                                      return Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      margin: const EdgeInsets.all(5),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          index = index;
                                          selectedBranchId = branch.id;
                                          stopAnim = false;
                                          setState(() {});
                                          Future.delayed(
                                            const Duration(seconds: 3),
                                                () {
                                              setState(() {
                                                stopAnim = true;
                                              });
                                            },
                                          );
                                        },
                                        title: branch.title.text.xl
                                            .make()
                                            .centered(),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                            Row(
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
                                    branchesProvider.branches
                                        .firstWhere((branch) =>
                                            branch.id == selectedBranchId)
                                        .title
                                        .text
                                        .color(isDarkModeEnabled
                                            ? Colors.lightBlueAccent
                                            : const Color.fromARGB(
                                                255, 239, 248, 142))
                                        .extraBold
                                        .make(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BookView(),
                  ],
                )
              : AnimationPage(isDarkModeEnabled,animations[index]),
        ),
      ),
    );
  }
}

class AnimationPage extends StatelessWidget {
  bool isDarkModeEnabled;
  String aniationId;

  AnimationPage(this.isDarkModeEnabled,this.aniationId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkModeEnabled
              ? const [Color(0x0048FFFF), Color(0xFF253341)]
              : const [Color(0xD545F3E4), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LottieBuilder.network(
        aniationId,
        height: 500,
        width: 500,
        animate: true,
        repeat: true,
        frameRate: FrameRate(60),
        reverse: true,
        fit: BoxFit.fitWidth,
      ).centered(),
    );
  }
}



