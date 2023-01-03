import 'package:aof_lessons/courseWorks/contact_app/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:starlight_utils/starlight_utils.dart';

class ContactAppAuthScreen extends StatefulWidget {
  const ContactAppAuthScreen({super.key});

  @override
  State<ContactAppAuthScreen> createState() => _ContactAppAuthScreenState();
}

class _ContactAppAuthScreenState extends State<ContactAppAuthScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController conPasswordCon = TextEditingController();
  FocusNode userNameF = FocusNode();
  FocusNode passwordF = FocusNode();
  FocusNode conPasswordF = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  return value?.isEmail == true
                      ? null
                      : "Please enter an email";
                },
                onEditingComplete: () {
                  passwordF.requestFocus();
                  // setState(() {});
                },
                controller: usernameCon,
                decoration: InputDecoration(
                    hintText: "Username", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              PasswordInput(
                hint: "Password",
                textControl: passwordCon,
                fnode: passwordF,
                validation: (e) {
                  return e?.isStrongPassword();
                },
                onEditingFunc: () {
                  conPasswordF.requestFocus();
                },
              ),
              SizedBox(
                height: 10,
              ),
              PasswordInput(
                validation: (x) {
                  return passwordCon.text == x
                      ? null
                      : "Password does not match";
                },
                hint: "Confirm Password",
                textControl: conPasswordCon,
                fnode: conPasswordF,
                onEditingFunc: () {},
              ),
              ElevatedButton(onPressed: () {}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
