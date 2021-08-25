import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_flutter/View/Home.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(
            color: HexColor('#B068D0'),
            fontWeight: FontWeight.w700
          ),),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),  
        ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child:
                  ListView(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage('assets/img/zaim.jpg'))
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Muhammad", style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700
                            ),),
                            SizedBox(height: 8,),
                            Text("Zaim Maulana", style: TextStyle(
                              color: HexColor('#B068D0'),
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 48,),
                    Text("Portfolio", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () async=> await launch('https://dribbble.com/Zaimm_'),
                      minWidth: 374,
                      height: 48,
                      color: HexColor('#B068D0'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/dribbble.svg'
                          ),
                          SizedBox(width: 8,),
                          Text("Dribbble", style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    MaterialButton(
                      onPressed: () async=> await launch('https://github.com/MZaimM'),
                      minWidth: 374,
                      height: 48,
                      color: HexColor('#B068D0'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/github.svg'
                          ),
                          SizedBox(width: 8,),
                          Text("Github", style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Contact Me", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () async=> await launch('https://wa.me/6282232267154'),
                      minWidth: 374,
                      height: 48,
                      color: HexColor('#B068D0'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/whatsapp.svg'
                          ),
                          SizedBox(width: 8,),
                          Text("Whatsapp", style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    MaterialButton(
                      onPressed: () async=> await launch('https://www.instagram.com/zaim_zilan/'),
                      minWidth: 374,
                      height: 48,
                      color: HexColor('#B068D0'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/instagram.svg'
                          ),
                          SizedBox(width: 8,),
                          Text("Instagram", style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    MaterialButton(
                      onPressed: () async=> await launch('https://www.facebook.com/zaim.maulana.3/'),
                      minWidth: 374,
                      height: 48,
                      color: HexColor('#B068D0'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/facebook.svg'
                          ),
                          SizedBox(width: 8,),
                          Text("Facebook", style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 36,),
                  ],))
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}