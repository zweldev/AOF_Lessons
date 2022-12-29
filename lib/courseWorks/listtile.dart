import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> userData = [
  {
    "avatar": [255, 0, 0],
    "name": "Kyaw Kyaw",
    "age": 19,
    "gender": "male"
  },
  {
    "avatar": [0, 255, 0],
    "name": "Tun Tun",
    "age": 20,
    "gender": "male"
  },
  {
    "avatar": [0, 0, 255],
    "name": "Su Su",
    "age": 21,
    "gender": "female"
  },
  {
    "avatar": [255, 0, 255],
    "name": "Min Min",
    "age": 22,
    "gender": "male"
  }
];

class User {
  List avatar;
  String name;
  int age;
  String gender;

  User(
      {required this.avatar,
      required this.name,
      required this.age,
      required this.gender});

  factory User.fromJSON(Map<String, dynamic> userDataMyr) {
    return User(
        avatar: userDataMyr["avatar"],
        name: userDataMyr["name"],
        age: userDataMyr["age"],
        gender: userDataMyr["gender"]);
  }
}

class ListTileEXP extends StatelessWidget {
  const ListTileEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "ListTile EXP",
        body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            final User user = User.fromJSON(userData[index]);
            print(user.name);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                selected: user.age > 20 ? true : false,
                style: ListTileStyle.drawer,
                onTap: () {},
                trailing: Icon(
                  Icons.heart_broken,
                  color: user.age > 20 ? Colors.red : Colors.grey,
                ),
                selectedTileColor: user.age > 20 ? Colors.amber : Colors.grey,
                selectedColor: user.age > 20 ? Colors.black : Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.grey.shade400,
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(
                          user.avatar[0], user.avatar[1], user.avatar[2], 1)),
                ),
                title: Text(user.name),
                subtitle: Text(user.age.toString()),
              ),
            );
          },
        ));
  }
}
