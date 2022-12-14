import 'package:db_flutter_app/firebase/add_car.dart';
import 'package:db_flutter_app/firebase/models/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCars extends StatefulWidget {
  const ListCars({Key? key}) : super(key: key);

  final Text title = const Text("Carros");

  @override
  _ListCarState createState() => _ListCarState();
}

class _ListCarState extends State<ListCars> {
  List<Car> cars = <Car>[];

  @override
  void initState() {
    super.initState();
    getAllCars();
  }

  getAllCars() async {}

  insertCar(Car car) async {}

  deleteCar(int index) async {}

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
                        MaterialPageRoute(builder: (context) => AddCar()))
                    .then((car) => {insertCar(car)});
              })
        ],
      ),
      body: ListView.separated(
        itemCount: cars.length,
        itemBuilder: (context, index) => buildListItems(index),
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }

  Widget buildListItems(int index) {
    Car p = cars[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          //leading: Text(p.id != null ? p.id.toString() : "-1"),
          title: Text(p.name),
          subtitle: Text(p.brand),
          onLongPress: () {
            deleteCar(index);
          },
        ),
      ),
    );
  }
}
