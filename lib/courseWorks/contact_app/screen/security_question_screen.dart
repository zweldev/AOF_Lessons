import 'package:aof_lessons/courseWorks/contact_app/utils/constant.dart';
import 'package:aof_lessons/courseWorks/contact_app/widgets/dropdown.dart';
import 'package:aof_lessons/courseWorks/contact_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class ContactSecurityQuestion extends StatefulWidget {
  ContactSecurityQuestion({super.key});

  @override
  State<ContactSecurityQuestion> createState() =>
      _ContactSecurityQuestionState();
}

class _ContactSecurityQuestionState extends State<ContactSecurityQuestion> {
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  FocusNode answer1F = FocusNode();
  FocusNode answer2F = FocusNode();
  FocusNode answer3F = FocusNode();
  String? question1;
  String? question2;
  String? question3;
  GlobalKey<FormState> _formstate = GlobalKey();

  List existQuestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                if (_formstate.currentState!.validate() != true) return;
              },
              child: Text("Save"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formstate,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactDropDown(
                  validator: (value) {
                    return value == null
                        ? "Question is required"
                        : existQuestions
                                    .where((element) => element == value)
                                    .toList()
                                    .length >
                                1
                            ? "Question must be unique"
                            : null;
                  },
                  hint: "Question 1",
                  value: question1,
                  onChanged: (e) {
                    existQuestions.remove(question1);
                    existQuestions.add(e);
                    question1 = e;
                    print(existQuestions);
                    setState(() {});
                  }),
              ContactAppInput(
                validator: (value) {
                  return null;
                },
                controller: answer1,
                focusNode: answer1F,
                hintText: "Username",
                oneditingComplete: answer2F.requestFocus,
              ),
              ContactDropDown(
                  validator: (value) {
                    return value == null
                        ? "Question is required"
                        : existQuestions
                                    .where((element) => element == value)
                                    .toList()
                                    .length >
                                1
                            ? "Question must be unique"
                            : null;
                  },
                  hint: "Question 2",
                  value: question2,
                  onChanged: (e) {
                    existQuestions.remove(question2);
                    existQuestions.add(e);
                    question2 = e;
                    print(existQuestions);
                    setState(() {});
                  }),
              ContactAppInput(
                validator: (value) {
                  return null;
                },
                controller: answer2,
                focusNode: answer2F,
                hintText: "Username",
                oneditingComplete: answer3F.requestFocus,
              ),
              ContactDropDown(
                  validator: (value) {
                    return value == null
                        ? "Question is required"
                        : existQuestions
                                    .where((element) => element == value)
                                    .toList()
                                    .length >
                                1
                            ? "Question must be unique"
                            : null;
                  },
                  hint: "Question 3",
                  value: question3,
                  onChanged: (e) {
                    existQuestions.remove(question3);
                    existQuestions.add(e);
                    question3 = e;
                    print(existQuestions);
                    setState(() {});
                  }),
              ContactAppInput(
                validator: (value) {
                  return null;
                },
                controller: answer3,
                focusNode: answer3F,
                hintText: "Username",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
