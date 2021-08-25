import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_flutter/View/Login.dart';
import 'package:project_flutter/View/page/HadistScreen.dart';
import 'package:project_flutter/View/page/Profile.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({ Key key }) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Future<void> _signOut()async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Muhammad Zaim Maulana"), 
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/img/zaim.jpg"),
            ), 
            accountEmail: Text("maulanazaim@gmail.com"),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/quran.svg',
              color: Colors.grey,
            ),
            title: Text("Quran Surat", style: TextStyle(
              fontSize: 16
            ),),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            iconData: Icon(Icons.book),
            title: Text("Daftar Hadist", style: TextStyle(
              fontSize: 16
            ),),
            onTilePressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HadistScreen()));
            },
          ),
          DrawerListTile(
            iconData: Icon(Icons.person),
            title: Text("Profil Pengguna", style: TextStyle(
              fontSize: 16
            ),),
            onTilePressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profile()));
            },
          ),
          DrawerListTile(
            iconData: Icon(Icons.logout, color: Colors.red,),
            title: Text("Log out", style: TextStyle(
              fontSize: 16,
              color: Colors.red
            ),),
            onTilePressed: (){
              _signOut().then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>LoginScreen())
              ));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  
  final Icon iconData;
  final Text title;
  final VoidCallback onTilePressed;

  const DrawerListTile({ Key key,  this.iconData, this.title,  this.onTilePressed }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: iconData,
      title: title,
    );
  }
}