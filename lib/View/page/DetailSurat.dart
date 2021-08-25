import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Models/Surat.dart';

class DetailSurat extends StatelessWidget {
  String nomor = "";
  String namaSurat ="";
  String asmaSurat = "";
  String artiSurat = "";
  DetailSurat({ Key key, this.nomor, this.namaSurat, this.asmaSurat, this.artiSurat }) : super(key: key);
  
  getAyatData() async{
    
    var response = await http.get(Uri.parse(
      "https://api.banghasan.com/quran/format/json/surat/"+nomor+"/ayat/1-10"));
    List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes))['ayat']['data']['ar'];

    List<SuratModel> users = [];

    for (var i = 0; i < jsonData.length; i++) {
      users.add(SuratModel.fromJson(jsonData[i]));
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Surat",style: TextStyle(
        fontFamily: "Poppins",
        color: HexColor("#B068D0"),
        fontWeight: FontWeight.w700,
      ),),
      elevation: 0,
      leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),  
      ),
      backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 0,right: 0,left: 0, bottom: 24),
        child:    
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.max,
         children: [
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
                   Text(namaSurat, style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w700,
                     color: Colors.white
                   ),),
                   SizedBox(height: 4,),
                   Text(asmaSurat, style: TextStyle(
                     color: Colors.white,
                     fontSize: 16
                   ),),
                   SizedBox(height: 4,),
                   Text(artiSurat, style: TextStyle(
                     color: Colors.white
                   ),),
                 ],
               ),
             ),
           ),
           SizedBox(height: 24,),
           Expanded(
             child: FutureBuilder(
              future: getAyatData(),
              builder: (context, snapshot){
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading...."),
                    ),
                  );
                }else{
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i){
                        return Card(
                          elevation: 2,
                          shadowColor: HexColor("#B068D0"),
                          child: ListTile(
                          //trailing: Text("("+snapshot.data[i].ayat+") "),
                          title: Container(
                            margin: EdgeInsets.only(left: 24),
                            child: Text(snapshot.data[i].teks +"  ("+snapshot.data[i].ayat+")  ", 
                              style: TextStyle(
                                fontFamily: "MADDINA",
                                fontSize: 20
                              ),
                              textAlign: TextAlign.right,),
                          ),
                        )
                        );
                      }
                    ),
                  );
                }
              }
            ),),
           
         ],
       ),
      ),
    );
  }
}