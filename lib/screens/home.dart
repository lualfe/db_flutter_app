import 'package:db_flutter_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final Text appBarTitle = const Text("Flutter Persistência");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: ListView(
        children: [
          ListTile(
            leading: buildSvgIcon("images/sqlite-icon.svg"),
            title: const Text("SQLite"),
            subtitle: const Text("Lista de pessoas"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, "/people");
            },
          ),
          listDividerMain(),
          ListTile(
            leading: buildSvgIcon("images/db.svg"),
            title: const Text("Floor"),
            subtitle: const Text("Lista de livros"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, "/books");
            },
          ),
          listDividerMain(),
          ListTile(
            leading: buildSvgIcon("images/firebase.svg"),
            title: const Text("Firebase Cloud Firestore"),
            subtitle: const Text("Lista de carros"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, "/cars");
            },
          ),
          listDividerMain(),
        ],
      ),
    );
  }
}
