import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_flutter/Models/Surat.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/View/Drawer.dart';
import 'package:project_flutter/View/page/DetailSurat.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  getUserData() async{
    var response = await http.get(Uri.parse(
      "https://api.banghasan.com/quran/format/json/surat"));
    List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes))['hasil'];

    List<SuratModel> users = [];

    for (var i = 0; i < jsonData.length; i++) {
      users.add(SuratModel.fromJson(jsonData[i]));
    }
    return users;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    setState(() {
      getUserData();
    });
  }
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text("Kutubu", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: HexColor("#B068D0")
            ),),
            Text("-Qu", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: HexColor("#FFCF89")
            ),),
          ],
        ),
        leading: Builder(
          builder: (context)=>IconButton(
          icon: SvgPicture.asset(
             "assets/icons/jam_menu.svg",
             
          ),
          onPressed: ()=>Scaffold.of(context).openDrawer(),
        ),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child:    
       Padding(
         padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20, top: 12),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.max,
           children: [
             Text("Assalaamu'alaikum", style: TextStyle(
               fontFamily: "Poppins",
               color: HexColor("#B068D0"),
               fontSize: 16,
               fontWeight: FontWeight.normal
             ),),
             SizedBox(height: 8,),
             Text("Muhammad Zaim Maulana", style: TextStyle(
               color: HexColor("#B068D0"),
               fontSize: 20,
               fontWeight: FontWeight.bold,
               fontFamily: 'Poppins'
             ), ),
             SizedBox(height: 12,),
             Expanded(
               child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot){
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading...."),
                      ),
                    );
                  }else{
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i){
                        return Card(
                          shadowColor: HexColor("#B068D0"),
                          elevation: 2,
                          child: ListTile(
                          leading: Text("("+snapshot.data[i].nomor+")", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: HexColor("#B068D0")
                          ),),
                          title: Text(snapshot.data[i].nama,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          subtitle: Text(snapshot.data[i].arti,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: HexColor("#B068D0")
                            ),
                          ),
                          trailing: Text(snapshot.data[i].asma, style: TextStyle(
                            fontSize: 16
                          ),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: 
                            (context)=>DetailSurat(nomor: snapshot.data[i].nomor,namaSurat: snapshot.data[i].nama, asmaSurat: snapshot.data[i].asma, artiSurat: snapshot.data[i].arti,)));
                          },
                        )
                        );
                      }
                    );
                  }
                }
              ),),
             
           ],
         ),
       ),
      ),
      drawer: DrawerScreen(),
    );
  }
}