import 'package:flutter/material.dart';
import 'package:example/utils/gradients.dart';
import 'package:gender_selection/gender_selection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gender Selection Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.red,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gender Selection Demo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GenderSelection(
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                  femaleImage: NetworkImage(
                      "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png"),
                  maleImage: NetworkImage(
                      "http://icon-library.net/images/avatar-icon/avatar-icon-4.jpg"),
                  selectedGenderIconBackgroundColor: Colors.amber,
                  selectedGenderTextStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                GenderSelection(
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                  maleText: "",
                  femaleText: "",
                  linearGradient: pinkRedGradient,
                  selectedGenderIconBackgroundColor: Colors.indigo,
                  checkIconAlignment: Alignment.centerRight,
                  equallyAligned: true,
                  animationDuration: Duration(milliseconds: 400),
                  isCircular: true,
                  isSelectedGenderIconCircular: true,
                  opacityOfGradient: 0.6,
                  padding: const EdgeInsets.all(3),
                  size: 120,
                ),
                GenderSelection(
                  maleImage: AssetImage("assets/images/male.png"),
                  femaleImage: AssetImage("assets/images/female.png"),
                  thirdGenderImage:
                      AssetImage("assets/images/third_gender.png"),
                  enableThirdGender: true,
                  selectedGenderIconBackgroundColor: Colors.green,
                  selectedGenderIconColor: Colors.white,
                  linearGradient: greenSexyGradient,
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                ),
                GenderSelection(
                  isCircular: false,
                  selectedGenderIconBackgroundColor: Colors.indigo,
                  linearGradient: skyBlueGradient,
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
