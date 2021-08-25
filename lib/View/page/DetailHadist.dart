import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Models/Hadist.dart';

class DetailHadist extends StatelessWidget {
  String id = "";
  String name = "";
  DetailHadist({ Key key , this.id, this.name}) : super(key: key);

  getHadistData() async{
    
    var response = await http.get(Uri.parse(
      "https://api.hadith.sutanlab.id/books/"+id+"?range=1-10"));
    List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes))['data']['hadiths'];

    List<HadistModel> users = [];

    for (var i = 0; i < jsonData.length; i++) {
      users.add(HadistModel.fromJson(jsonData[i]));
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Hadist", style: TextStyle(
          fontWeight: FontWeight.w700,
          color: HexColor("#B068D0")
        ),),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),  
        ),
        ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 12,),
            Card(
             shadowColor: HexColor("#B068D0"),
             elevation: 4,
             margin: EdgeInsets.only(right: 20, left: 20),
             color: HexColor("#B068D0"),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)),
             child: Container(
               height: 141,
               width: 370,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/img/card.png'),
                   fit: BoxFit.fitWidth,
                  ),
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   SvgPicture.asset(
                     'assets/icons/quran.svg'
                   ),
                   SizedBox(height: 4,),
                   Text(name, style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w700,
                     color: Colors.white
                   ),),
                 ],
               ),
             ),
           ),
           SizedBox(height: 24,),
            Expanded(
              child: FutureBuilder(
                future: getHadistData(),
                builder: (context, snapshot){
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                          child: Text("Loading...."),
                        ),
                      );
                  } else {
                    return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,i){
                      return Card(
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                        child:ListTile(
                            leading: Text("("+snapshot.data[i].number.toString()+")", style: TextStyle(
                              color:HexColor("#B068D0"),
                              fontWeight: FontWeight.w500 
                            ),),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(snapshot.data[i].arab, 
                                textAlign: TextAlign.right,),
                            ),
                            subtitle: Text("\nArtinya: \n"+snapshot.data[i].id, textAlign: TextAlign.justify,),
                          ),
                      );
                    }
                  );
                  }
                }
              )
            ),
          ],
        ),
      ),
      );
  }
}