import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Models/Hadist.dart';
import 'package:project_flutter/View/page/DetailHadist.dart';

class HadistScreen extends StatefulWidget {
  const HadistScreen({ Key key }) : super(key: key);

  @override
  _HadistScreenState createState() => _HadistScreenState();
}

class _HadistScreenState extends State<HadistScreen> {
  getHadistData() async{
    var response = await http.get(Uri.parse(
      "https://api.hadith.sutanlab.id/books"));
    List<dynamic> jsonData = jsonDecode(response.body)['data'];

    List<HadistModel> hadists = [];

    for (var i = 0; i < jsonData.length; i++) {
      hadists.add(HadistModel.fromJson(jsonData[i]));
    }
    return hadists;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    setState(() {
      getHadistData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Hadist", style: TextStyle(
          fontWeight: FontWeight.w700,
          color: HexColor("#B068D0"),
        ),),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),  
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
          margin: EdgeInsets.only(top: 20,right: 20,left: 20),
          child:  
         Column(
           children: [
             FutureBuilder(
                future: getHadistData(),
                builder: (context, snapshot){
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading...."),
                      ),
                    );
                  }else{
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i){
                        int a = i+1;
                        return Card(
                          elevation: 2,
                          shadowColor: HexColor("#B068D0"),
                          child: ListTile(
                          leading: Text("(${a++})", style: TextStyle(
                            color: HexColor("#B068D0"),
                          ),),
                          title: Text(snapshot.data[i].name, style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>DetailHadist(id: snapshot.data[i].id, name: snapshot.data[i].name,)));
                          },
                        )
                        );
                      }
                    );
                  }
                }
              ),
           ],
         ),
        ),
        ),
      ),
    );
  }
}