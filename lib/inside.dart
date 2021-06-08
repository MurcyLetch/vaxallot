import 'package:flutter/material.dart';

class Inside extends StatefulWidget {
  final List slots;

  const Inside({Key key, this.slots}) : super(key: key);
 

  @override
  _InsideState createState() => _InsideState();
}

class _InsideState extends State<Inside> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Slots'),),
      body: Container(
        height:MediaQuery.of(context).size.height ,
        width:MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.slots.length,
          itemBuilder: (context,index){
            //margin:EdgeInsets.all(10);
            //padding:EdgeInsets.all(10);
            return Container(
              padding:EdgeInsets.all(10),
              margin:EdgeInsets.all(10),
              color:Colors.grey.shade800,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text('Center Id - '+widget.slots[index]['center_id'].toString(),style: TextStyle(
                    fontSize: 14,
                  ),),
                  Text('Center Name - '+widget.slots[index]['name'].toString(),style: TextStyle(
                    fontSize: 14,
                  ),),
                  Text('Center Address - '+widget.slots[index]['address'].toString(),style: TextStyle(
                    fontSize: 14,
                  ),),
                  Divider(),
                    Text('Vaccine Name - '+widget.slots[index]['vaccine'].toString(),style: TextStyle(
                    fontSize: 12,
                  ),),
                  Divider(),
                    Text('Available Slots - '+widget.slots[index]['slots'].toString(),style: TextStyle(
                    fontSize: 12,
                  ),),
                ],
              ),
              );
          },
        ),
        ),
    );
  }
}