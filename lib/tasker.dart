import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

class Tasker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasker',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: TaskerHomePage(),
    );
  }
}

class TaskerHomePage extends StatefulWidget {
  TaskerHomePage({Key key}) : super(key: key);

  @override
  _TaskerHomePageState createState() => _TaskerHomePageState();
}

class _TaskerHomePageState extends State<TaskerHomePage> {
  DocumentList documentList = DocumentList(
      "My Task", labels: {
    "Complete": "done?",
    "Title": "title",
    "Date": "date",
    "Priority": "pri count",
    "Description": "subtitle"
  });

  @override
  Widget build(BuildContext context) {

    return DocumentListScaffold(
      documentList,
      customItemBuilder: customItemBuilder,

    );
  }
}

Widget customItemBuilder(int index, Document doc, BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme;
  return Card(
    child: Column(
      children: <Widget>[
        Text(
          doc["title"],
          // ignore: deprecated_member_use
          style: textTheme.headline,
        ),
        Text(
          doc["date"],
          // ignore: deprecated_member_use
          style: textTheme.subhead,
        ),
        Text(
          doc["subtitle"],
          // ignore: deprecated_member_use
          style: textTheme.subhead,
        ),
      ],
    ),
  );
}
