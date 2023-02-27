import 'package:flutter/material.dart';

class ListApp extends StatelessWidget {
  final List<ListItem> items;

  const ListApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
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
      debugShowCheckedModeBanner: false
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
