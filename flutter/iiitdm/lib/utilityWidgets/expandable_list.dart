import 'package:flutter/material.dart';
import 'package:iiitdm/screens/course_list_screen.dart';

class ExpandableList extends StatefulWidget {
  final String title;
  final Map<String, String> items;
  final String screenRouteName;

  ExpandableList(this.title, this.items, this.screenRouteName);
  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> listTiles = [];
    widget.items.forEach((key, value) {
      listTiles.add(GestureDetector(
        onTap: () {
          if (widget.screenRouteName == CourseListScreen.routeName) {
            Navigator.of(context)
                .pushNamed(widget.screenRouteName, arguments: key);
          }
        },
        child: ListTile(title: Text(value)),
      ));
    });
    return ExpansionTile(
      title: Text(widget.title),
      leading: Icon(Icons.list),
      initiallyExpanded: _isExpanded,
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      children: listTiles,
    );
  }
}
