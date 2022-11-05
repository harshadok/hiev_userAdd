import 'package:flutter/material.dart';

import 'package:login_app_pooni/sign_up/view/sign_up.dart';
import 'package:login_app_pooni/sign_up/view_model/sign_up_provider.dart';
import 'package:provider/provider.dart';

import '../sign_up/model/model.dart';

class FullDetails extends StatelessWidget {
  FullDetails({super.key, required this.data});

  List<Model> data;
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<SignUpProvider>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Text(
              "User ID :    ${data.first.id} ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "First Name :    ${data.first.firstName} ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Last Name :    ${data.first.lastName} ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Phone No :    ${data.first.Phone} ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Age :    ${data.first.age} yrs ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  authProvider.deletestudent(data.first.id!);
                  Navigator.of(context).pushAndRemoveUntil<void>(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignUp()),
                    ModalRoute.withName('/'),
                  );
                },
                child: const Text(
                  "Add New ",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      )),
    );
  }
}
