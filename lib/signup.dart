import 'package:flutter/material.dart';
import './signin.dart';
import './ProfList.dart';
import './addCard.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _doSomething() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new ProfilePage(myController.text)));
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          color: Color.fromARGB(255, 57, 59, 61),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
                child: SizedBox(
                    child: Container(color: Color.fromARGB(255, 57, 59, 61)))),
            Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text('Sign In',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 250, 250, 250)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 250, 250, 250))))),
                      ))),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: null,
                    child: Text('Sign Up',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 201, 214, 223)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 201, 214, 223)))))),
              ))
            ]))
          ])),
      Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          color: Color.fromARGB(255, 57, 59, 61),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 250, 250, 250),
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Name',
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 250, 250, 250),
                      border: OutlineInputBorder(),
                      hintText: 'Enter your e-mail address',
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 250, 250, 250),
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value ?? false;
                    });
                  },
                ),
              ),
            )),
            Expanded(
                child: const Text(
              'I have read and accept terms and conditions',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 201, 214, 223)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 201, 214, 223))))),
                  onPressed: agree ? _doSomething : null,
                  child: const Text('Sign Up',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
            ))
          ])),
      Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/FastParkLogo.png"),
                  fit: BoxFit.fill))),
    ])));
  }
}

class ProfilePage extends StatelessWidget {
  final String person;
  ProfilePage(@required this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          child: Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Expanded(
                    child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 201, 214, 223),
                  backgroundImage: AssetImage('asset/images/AvatarPic.png'),
                )),
                Expanded(
                    child: Text(person,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.6))))
              ]))),
      Container(
          height: MediaQuery.of(context).size.height * 0.55,
          width: double.infinity,
          child:     ListApp(
      items: List<ListItem>.generate(
        9,
        (i) => (i == 4 || i == 6 || i==8)
            ? HeadingItem(i)
            : MessageItem(i),
      ),
    ) 
          ),
      Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          child: BottomBar())
    ])));
  }
}

Widget BuildCard(int index) {
  List<String> Texts = [
    'Manage your account',
    'Payments & rewards',
    'Notifications',
    'Privacy and sharing'
  ];
  return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 251, 254),
          border: Border(
            bottom: BorderSide(width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
          )),
      child: Center(
          child: Text(Texts[index],
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.6)))));
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Color.fromARGB(255, 165, 160, 160),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: TextButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      screenHeight, screenWidth), // <--- this line helped me
                ),
                icon: Icon(Icons.home), //icon data for elevated button
                label: Text("Home"), //label text
                onPressed: () => null,
              )),
              Expanded(
                  child: TextButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      screenHeight, screenWidth), // <--- this line helped me
                ),
                icon: Icon(Icons.history), //icon data for elevated button
                label: Text("Activity"), //label text
                onPressed: () => null,
              )),
              Expanded(
                  child: TextButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      screenHeight, screenWidth), // <--- this line helped me
                ),
                icon:
                    Icon(Icons.account_circle), //icon data for elevated button
                label: Text("Account"), //label text
                onPressed: () => null,
              )),
            ],
          ),
        ));
  }
}
