import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:project_flutter/View/Home.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  // ignore: missing_return
  Future<String> _authUser(LoginData data) async{
    try {
      print('Name: ${data.name}, Password: ${data.password}');
      return await Future.delayed(loginTime).then((_){
      _firebaseAuth.signInWithEmailAndPassword(
            email: data.name, 
            password: data.password
        );
      
        return null;   
      });   
    } on FirebaseAuthException catch  (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    
  }

  Future<String>_signUp(LoginData data)async{
    return Future.delayed(loginTime).then((_){
      _firebaseAuth.createUserWithEmailAndPassword(
        email: data.name, 
        password: data.password
      );

     return null;
    });
  }
  

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //title: 'Kutubu-Qu',   
      logo: 'assets/icons/Kutubu-Qu.png',
      onLogin: _authUser,
      onSignup: _signUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:passwordfield/passwordfield.dart';
// import 'package:project_flutter/View/Home.dart';

// class Login extends StatefulWidget {
//   const Login({ Key key }) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           margin: EdgeInsets.only(top: 60, right: 20, left: 20),
//           child: ListView(
//             children: <Widget>[
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Kutubu", style: TextStyle(
//                       color: HexColor('#B068D0'),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold
//                     ),),
//                     Text("-Qu",style: TextStyle(
//                       color: HexColor("#FFCF89"),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold
//                     ),)
//                   ],
//               ),
//               SizedBox(height: 60,),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: HexColor('#B068D0'), width: 2)
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: HexColor('#B068D0'))
//                   ),
//                   hintText: "Email",
//                 ),
//               ),
//               SizedBox(height: 16,),
//               PasswordField(
//                 color: HexColor('#B068D0'),
//                 controller: passwordController,
//                 hintText: "Password",
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: HexColor('#B068D0'), width: 2)
//                   ),
//                 border: OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(30),
//                   borderSide: BorderSide(color: HexColor("#B068D0"))
//                 ),  
//                 suffixIcon: Icon(Icons.remove_red_eye,),
//               ),
//               SizedBox(height: 24,),
//               MaterialButton(
//                 onPressed: ()async{
//                   await _firebaseAuth.signInWithEmailAndPassword(
//                     email: emailController.text, 
//                     password: passwordController.text).then(
//                       (value) => Navigator.pushReplacement(context, MaterialPageRoute(
//                         builder: (context)=>Home())));
//                 },
//                 color: HexColor("#B068D0"),
//                 height: 48.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)),
//                 child: Text("Login", style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14
//                 ),),
//               ),
//               SizedBox(height: 16,),
//               MaterialButton(
//                 onPressed: ()async{
//                   await _firebaseAuth.createUserWithEmailAndPassword(
//                     email: emailController.text, 
//                     password: passwordController.text);
//                 },
//                 height: 49.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   side: BorderSide(color: HexColor("#B068D0"))
//                 ),
//                 child: Text("Register", style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: HexColor("#B068D0")
//                 ),),
//               )
//             ],),
//         ),
//       );
//   }
// }

