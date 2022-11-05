import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_app_pooni/sign_up/model/model.dart';

class SignUpProvider extends ChangeNotifier {
  List<Model> personList = [];
  bool showOtpWidget = false;
  final nameController = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  bool isPasswordEightCharacters = false;

  onPasswordChanged(String password) {
    log(password);
    notifyListeners();

    isPasswordEightCharacters = false;
    if (password.length >= 10) {
      isPasswordEightCharacters = true;
    }
  }

  Future<void> adDetails(context) async {
    final name = nameController.text.trim();
    final pass = password.text.trim();
    final emai = email.text.trim();
    final phone = phonenumber.text.trim();
    log(emai.length.toString());

    if (pass.length != 10) {
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
                "Password must have 10 ",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            );
          });
    } else {
      final person = Model(
        name: name,
        pass: pass,
        email: emai,
        phone: phone,
      );

      addStudent(person);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[300],
          content: const Text("Registration Completed")));
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (ctx) => const HomePage()));
    }
  }

  Future<void> addStudent(Model value) async {
    final studentDb = await Hive.openBox<Model>('student_db');
    final id = await studentDb.add(value);
    value.id = id;
    personList.add(value);
    notifyListeners();
    studentDb.put(value.id, value);
    notifyListeners();
    //print(personList.length);
  }
}
