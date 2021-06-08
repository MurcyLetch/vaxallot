import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:vaxallot/http.dart' ;
import 'package:http/http.dart' as http;
import 'package:vaxallot/inside.dart';
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
  String dropdownValue = '01';
  List slots=[];
  
  fetchslots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pincodectrl.text +
                '&date=' +
                dayctrl.text +
                '%2F' +
                dropdownValue +
                '%2F2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      print(result);
      setState(() {
        slots = result['sessions'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Inside(
                    slots: slots,
                  )));
    });
  }
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
                  )),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Container(
                        height: 56,
                        child: DropdownButton<String>(
                          isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.date_range),
                    iconSize: 24,
                    elevation: 16,
                    //style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                        height: 2,
                        color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                    },
                    items: <String>[
                        '01',
                        '02',
                        '03',
                        '04',
                        '05',
                        '06',
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12'
                    ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                    }).toList(),
                  ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child:ElevatedButton(
                  
                  onPressed: (){
                    fetchslots();
                  },
                  child: Text('Find Slots'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                   ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
