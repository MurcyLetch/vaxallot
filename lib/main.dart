import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pincodectrl = TextEditingController();
  TextEditingController dayctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccinations niches'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                child: Image.asset('assets/images/vaccine11.png'),
              ),
              TextField(
                //scrollPadding: EdgeInsets.all(20),
                controller: pincodectrl,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Type your Pincode',
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 60,
                    child: TextField(
                      controller: dayctrl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Enter Date',
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
