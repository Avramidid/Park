import 'package:flutter/material.dart';
import './signup.dart';
import './signin.dart';
import './auxileries.dart';
import 'cardimage.dart';
import './addCard.dart';
import './RatingsScreen.dart';
import 'package:vibration/vibration.dart';
import './HomeScreenie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/FastParkLogo.png"),
                  fit: BoxFit.fill))),
      Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/FastParkHome.png"),
                  fit: BoxFit.fill))),
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        color: Color.fromARGB(106, 196, 171, 171),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 201, 214, 223)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 201, 214, 223))))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text('Log In',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 201, 214, 223)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 201, 214, 223))))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text('Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
          )
        ]),
      )
    ]);
  }
}

class ListApp extends StatelessWidget {
  final List<ListItem> items;

  const ListApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final int heading;
  final List<String> Heading = [
    '',
    '',
    '',
    '',
    'Help And Support',
    '',
    'Partners',
    '',
    'Legal',
  ];
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      Heading[heading],
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final int index;
  final List<String> Heading = [
    'Manage your account',
    'Payments & rewards',
    'Notifications',
    'Privacy and sharing',
    '',
    'Contact Customer Service',
    '',
    'List your parking space',
    '',
    'Terms of service'
  ];

  MessageItem(this.index);

  @override
  Widget buildTitle(BuildContext context) => Text(Heading[index]);
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}
