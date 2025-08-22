import 'package:flutter/material.dart';
import 'package:lets_code/auth_service.dart';
import 'package:lets_code/main.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authInit();
  }
  void authInit() async{
    bool check=await AuthService().authenticateLocally();
    if(check){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>MyHomePage()));
    }else{
      ScaffoldMessenger(child: SnackBar(content:Text("Failed",style:TextStyle(fontFamily:"Mozilla"),)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child:Container(
            child:IconButton(onPressed:() async{
                authInit();
            },
                icon:Icon(Icons.fingerprint,size:50,)),
          ),
        ),
      ),
    );
  }
}
