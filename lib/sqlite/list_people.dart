import 'package:db_flutter_app/sqlite/daos/PersonDao.dart';
import 'package:db_flutter_app/sqlite/models/Person.dart';
import 'package:flutter/material.dart';

class ListPeople extends StatefulWidget {
  const ListPeople({Key? key}) : super(key: key);

  final Text title = const Text("Pessoas");

  @override
  State<ListPeople> createState() => _ListPeopleState();
}

class _ListPeopleState extends State<ListPeople> {
  List<Person> people = <Person>[];

  @override
  void initState(){
    super.initState();
    getAllpeople();
  }

  getAllpeople() async{
    List<Person> result= await PersonDAO().readAll();
    setState(() {
      people = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title),
      body: ListView(children: buildListItems()),
    );
  }

  List<Widget> buildListItems(){
    return people.map((p) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)
          ),
          child: ListTile(
            leading: Text(p.id!.toString()),
            title: Text(p.firstName),
            subtitle: Text(p.lastName),
          ),
        ),
      )).toList();
  }
}