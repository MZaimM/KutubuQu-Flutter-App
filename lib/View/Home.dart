import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_flutter/View/page/Dashboard.dart';
import 'package:project_flutter/View/page/Profile.dart';
import 'package:project_flutter/View/page/HadistScreen.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screen = [
    Dashboard(),
    HadistScreen(),
    Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          bucket: bucket, 
          child: currentScreen),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HadistScreen()));
          },
          backgroundColor: HexColor("#B068D0"),
          child: Icon(Icons.book),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 16,
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen = Dashboard();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/quran.svg",
                            color: currentTab == 0 ? HexColor("#B068D0") : Colors.grey,   
                          ),
                          Text("Surat", style: TextStyle(
                            color: currentTab == 0 ? HexColor("#B068D0") : Colors.grey
                          ),)
                        ],
                      ),
                ),
                SizedBox(width: 120,),
                MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen = Profile();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_sharp,
                          color: currentTab == 1 ? HexColor("#B068D0") : Colors.grey,
                          ),
                          Text("Profile", style: TextStyle(
                            color: currentTab == 1 ? HexColor("#B068D0") : Colors.grey
                          ),)
                        ],
                      ),
                    )
              ],
            ),
          ),
        ),
      );
  }
}