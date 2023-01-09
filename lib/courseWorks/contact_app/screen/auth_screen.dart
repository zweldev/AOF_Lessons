import 'package:aof_lessons/courseWorks/contact_app/model/user_model.dart';
import 'package:aof_lessons/courseWorks/contact_app/service/auth.dart';
import 'package:aof_lessons/courseWorks/contact_app/utils/constant.dart';
import 'package:aof_lessons/courseWorks/contact_app/widgets/password_input.dart';
import 'package:aof_lessons/courseWorks/contact_app/widgets/textField.dart';
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
  int buildTime = 0;
  ContactAppAuthService authService = ContactAppAuthService();

  Future<void> register() async {
    if (formKey.currentState!.validate() != true) return;
    await authService.register(
        ContactAppUser(username: usernameCon.text, pass: passwordCon.text));
    Navigator.of(context).pushNamedAndRemoveUntil(SECURITY, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    buildTime++;
    print("Screen Buildtime is $buildTime");
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
              ContactAppInput(
                
                validator: (value) {
                  return value?.isNotEmpty == true
                      ? authService.exist.contains(value)
                          ? 'User already exist'
                          : null
                      : "Please enter an email";
                },
                controller: usernameCon,
                focusNode: userNameF,
                hintText: "Username",
              ),

              // TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
              //   validator:
              // (value) {
              //     return value?.isNotEmpty == true
              //         ? authService.exist.contains(value)
              //             ? 'User already exist'
              //             : null
              //         : "Please enter an email";
              //   },
              //   onEditingComplete: () {
              //     passwordF.requestFocus();
              //     // setState(() {});
              //   },
              //   controller: usernameCon,
              //   decoration: InputDecoration(
              //       hintText: "Username", border: OutlineInputBorder()),
              // ),
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
                onEditingFunc: register,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate() != true) return;
                        await authService.register(ContactAppUser(
                            username: usernameCon.text,
                            pass: passwordCon.text));
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SECURITY, (route) => false);
                      },
                      child: Text("Submit")))
            ],
          ),
        ),
      ),
    );
  }
}
