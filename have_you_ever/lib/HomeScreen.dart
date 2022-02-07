import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>questions=[
    'Have you ever wrote a letter?',
    'Have you ever smoked a cigerette?',
    'Have you ever hit on by someone who was too old?',
    'Have you ever on the radio or TV?',

  ];
  int index=0, yesCounter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Have You Ever'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Center(
            child:(index<4)?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(  
                  
                  questions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                RaisedButton(
                    color: Colors.green[600],
                    child: Text(
                      'yes',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                      setState(() {
                        index++;
                        yesCounter++;
                      });
                    }),
                RaisedButton(
                  color: Colors.amber,
                  onPressed:()
                  {
                    setState(() {
                      index++;
                    });
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ) :Column( children: [
              (yesCounter>=3)?
              Image.asset('lib/assets/images/loser.jpg'):
              Image.asset('lib/assets/images/winner.jpg'),
             RaisedButton(color: Colors.black, child : Text('play again', style: TextStyle(color: Colors.white),) ,onPressed: (){
               setState(() {
                 index=0;
                 yesCounter=0;
                 questions.shuffle();
               });
             }),
            ],
              
            ),
          ),
          );
  }
}