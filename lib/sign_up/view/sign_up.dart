import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/sign_up_provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    final authProvider = context.watch<SignUpProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: hight * 0.2,
                child: const Text(
                  "Add User",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: authProvider.firsName,
                decoration: InputDecoration(
                    hintText: "First Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: authProvider.lstName,
                decoration: InputDecoration(
                    hintText: "Last Name",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                onChanged: (String values) {
                  authProvider.onPasswordChanged(values);
                },
                controller: authProvider.phone,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            EmailRegWidget(provider: authProvider),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Select Your Age",
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: authProvider.chosenValue,
                  //elevation: 5,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: authProvider.age
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Please choose a Age",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    authProvider.slectedAge(value!);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  authProvider.adDetails(context);
                },
                child: const Text("Sign Up")),
          ],
        ),
      )),
    );
  }
}

class EmailRegWidget extends StatelessWidget {
  const EmailRegWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final SignUpProvider provider;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, value, _) {
        return Visibility(
          visible: !value.showOtpWidget,
          child: Column(
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: value.isPasswordEightCharacters
                            ? Colors.green
                            : Colors.transparent,
                        border: value.isPasswordEightCharacters
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Contains at least 10 characters")
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
