import 'package:flutter/material.dart';
import 'package:login_app_pooni/full_details.dart/full_details.dart';
import 'package:login_app_pooni/sign_up/model/model.dart';

class HomeScree extends StatelessWidget {
  HomeScree({super.key, required this.model});
  List<Model> model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            Center(
              child: SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                      "Congratulation ${model.first.firstName} ${model.first.lastName} has been added!"),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => FullDetails(
                            data: model,
                          )));
                },
                child: const Text("Show Your Details")),
          ],
        ),
      )),
    );
  }
}
