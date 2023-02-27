import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cardimage.dart';




class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardName = TextEditingController();
  TextEditingController cardDate = TextEditingController();
  int counter = 0;
  final List<ImageWithText> cards = [];

  void addImageWithText(String number, String date, String name) {
    setState(() {
      counter++;
      cards.add(ImageWithText(
        Number: number,
        Date: date,
        Name: name,
        
      ));
    });
   
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  // @override
  // void initState() {
  //   cardNumber.addListener(
  //     () {
  //       getCardTypeFrmNumber();
  //     },
  //   );
  //   super.initState();
  // }

  @override
  void dispose() {
    cardNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.5;
    final screenHeight = MediaQuery.of(context).size.height * 0.5;
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView(
                    controller: _scrollController,
                    children: cards,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cardNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        hintText: "Card number",
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: cardName,
                      decoration: const InputDecoration(hintText: "Full name"),
                    ),
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cardDate,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            // Limit the input
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter(),
                          ],
                          decoration: const InputDecoration(hintText: "MM/YY"),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                          ],
                          decoration: const InputDecoration(hintText: "CVV"),
                        ),
                      ),
                    ],
                  )),
                ],
              )),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                        child: const Text("Add card"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenHeight * 0.3,
                              screenWidth * 0.5), // <--- this line helped me
                        ),
                        onPressed: () {
                          addImageWithText(
                              cardNumber.text, cardDate.text, cardName.text);
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
