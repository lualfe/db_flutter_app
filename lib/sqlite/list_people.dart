import 'package:db_flutter_app/sqlite/add_person.dart';
import 'package:db_flutter_app/sqlite/daos/PersonDao.dart';
import 'package:db_flutter_app/sqlite/models/Person.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ListPeople extends StatefulWidget {
  const ListPeople({Key? key}) : super(key: key);

  final Text title = const Text("Pessoas");

  @override
  State<ListPeople> createState() => _ListPeopleState();
}

class _ListPeopleState extends State<ListPeople> {
  List<Person> people = <Person>[];

  @override
  void initState() {
    super.initState();
    getAllPeople();
  }

  getAllPeople() async {
    List<Person> result = await PersonDAO().readAll();
    setState(() {
      people = result;
    });
  }

  insertPerson(Person person) async {
    int id = await PersonDAO().insertPerson(person);
    if (id > 0) {
      person.id = id;
      setState(() {
        people.add(person);
      });
    }
  }

  deletePerson(int index) async {
    Person person = people[index];
    if (person.id != null) {
      await PersonDAO().deletePersonById(person.id!);
      setState(() {
        people.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPerson()))
                    .then((person) => {insertPerson(person)});
              })
        ],
      ),
      body: ListView.separated(
        itemCount: people.length,
        itemBuilder: (context, idx) => buildListItem(idx),
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }

  Widget buildListItem(int index) {
    Person p = people[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          leading: Text(p.id != null ? p.id.toString() : "-1"),
          title: Text(p.firstName),
          subtitle: Text(p.lastName),
          onLongPress: () {
            deletePerson(index);
          },
        ),
      ),
    );
  }
}
