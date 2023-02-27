import 'package:flutter/material.dart';
import './signup.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool agree = false;
  void _doSomething() {
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
          color: Color.fromARGB(255, 57 ,59, 61),
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: null, child: Text('Sign In',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 201, 214, 223)),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color.fromARGB(255, 201, 214, 223))
    )
  )
            ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed:() {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>  SignUpScreen()),
  );
}
              , child: Text('Sign Up',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 250, 250)),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color.fromARGB(255, 250, 250, 250))
    )
  )
            )),
            )
          ]
          )
          ),
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          color: Color.fromARGB(255, 57 ,59, 61),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child:
              SizedBox(
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
      ),



      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child:
              SizedBox(
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
      ),



       Padding(
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
       ),
            const Text(
              'Stay Signed In?',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: ElevatedButton(
              style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 201, 214, 223)),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromARGB(255, 201, 214, 223))
    )
  )
              ),  
              onPressed: null, //agree ? _doSomething : null,
              child: const Text('Sign in',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))
              ),
            )   
          
          ]
      )
      ), 
      Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/FastParkLogo.png"),
                  fit: BoxFit.fill))),     
    ]
    )
    )
    );
  }
}