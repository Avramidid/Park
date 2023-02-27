import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String subtitle;
  final bool isButtonVisible; 
  CardModel(this.title, this.subtitle, this.isButtonVisible);
}

class ProfilePage2 extends StatelessWidget {
  final String person;
  ProfilePage2(@required this.person);

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
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          child: BottomBar())
    ])));
  }
}
List<CardModel> cards = [
    CardModel('Card 1', 'Subtitle 1', false),
    CardModel('Card 2', 'Subtitle 2', true),
    CardModel('Card 3', 'Subtitle 3', false),
  ];

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
                onPressed: (){Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CardListScreen(cards: cards)),
);},
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

class CardListScreen extends StatelessWidget {
  final List<CardModel> cards;

  CardListScreen({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card List'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children:[
              Expanded(child:
              ListTile(
              title: Text(cards[index].title),
              subtitle: Text(cards[index].subtitle),
            ),
              ),
              Expanded(child: Text('Dimitris'))
            ]
            )
          );
        },
      ),
    );
  }
}
