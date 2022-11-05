// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_app_pooni/home_screen.dart/home_screen.dart';
import 'package:login_app_pooni/sign_up/model/model.dart';

class SignUpProvider extends ChangeNotifier {
  List<Model> personList = [];
  bool showOtpWidget = false;
  final firsName = TextEditingController();
  final lstName = TextEditingController();
  final phone = TextEditingController();

  bool isPasswordEightCharacters = false;
  String? chosenValue;
  List<String> age = [
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    "28",
    "29",
    "30"
  ];
  slectedAge(String value) {
    chosenValue = value;
    notifyListeners();
  }

  onPasswordChanged(String password) {
    log(password);
    notifyListeners();

    isPasswordEightCharacters = false;
    if (password.length >= 10) {
      isPasswordEightCharacters = true;
    }
  }

  Future<void> adDetails(context) async {
    final fisrName = firsName.text.trim();
    final LstName = lstName.text.trim();
    final Phone = phone.text.trim();
    final age = chosenValue;
    //log(Phone.length.toString());

    if (fisrName.isEmpty ||
        LstName.isEmpty ||
        Phone.length != 10 ||
        age == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
              title: const Text(
                "Please Enter Full Details",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            );
          });
    } else {
      final person = Model(
        firstName: fisrName,
        lastName: LstName,
        Phone: Phone,
        age: age,
      );

      await addStudent(person);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[300],
          content: const Text("Registration Completed")));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => HomeScree(
                model: personList,
              )));

      dispoose();
    }
  }

  dispoose() {
    firsName.clear();
    lstName.clear();
    phone.clear();
    age.clear();
  }

  Future<void> addStudent(Model value) async {
    final studentDb = await Hive.openBox<Model>('student_db');
    final idd = await studentDb.add(value);
    value.id = idd;
    personList.add(value);
    notifyListeners();
    print(personList.length);
    //print("personList.first.name : ${personList.first.firstName}");
  }

  Future<void> deletestudent(int id) async {
    final studentDb = await Hive.openBox<Model>('student_db');
    await studentDb.delete(id);
    personList.removeAt(id);
    notifyListeners();
  }
}
