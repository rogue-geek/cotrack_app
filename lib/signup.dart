import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

enum AccType {merchant, individual}

void main(){
  runApp(SignUp());
}

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpBody(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: colPrim,
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        // accentColor: colAcc,
        // hintColor: colHint,
        unselectedWidgetColor: colAcc,
        // radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => colAcc)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50))),
        inputDecorationTheme: InputDecorationTheme(
          // labelStyle: TextStyle(color: Color(0xffffffff)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colAcc, width: 3.0)),
          border: OutlineInputBorder(),
          // filled: true,
          // fillColor: Color(0x22ffbd59)
        )
      ),
    );
  }
}

class SignUpBody extends StatefulWidget{
  @override
  SignUpBodyState createState() => SignUpBodyState();
}

class SignUpBodyState extends State<SignUpBody>{
  AccType? _type = AccType.individual;
  String btnText = "Create New Account";
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(children:[
          Image.asset('images/icon.png', width: 80)
        ], mainAxisAlignment: MainAxisAlignment.center,)
      ),
      body: Center(child: Padding(padding: EdgeInsets.symmetric(horizontal: 0.05*sw),
      child: ListView(
        children: [
          // Image.asset('images/logo.png', height: logosize, width: logosize),
          SizedBox(height: 30),
          Center(child:Text("Getting Started with CoTrack")),
          SizedBox(height: 20),
          TextField(
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
            labelText: "Full Name",
            hintText: "John Doe"
          )),
          SizedBox(height: 10),
          TextField(
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
            labelText: "Email",
            hintText: "johndoe@example.com"
          )),
          SizedBox(height: 10),
          TextField(
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
            labelText: "Phone",
            hintText: "1234567890",
            prefix: Text("+91  ", style: TextStyle(color: Colors.black))
          ), keyboardType: TextInputType.number, inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]),
          SizedBox(height: 10),
          TextField(
            // style: TextStyle(color: Colors.white),
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Create a strong password",
          )),
          SizedBox(height: 10),
          // Divider(color: colAcc, thickness: 1, endIndent: 20, indent: 20),
          SizedBox(height: 10),
          Center(child: Text("Choose Account Type")),
          Row(children: [
            Radio(value: AccType.merchant, groupValue: _type, onChanged: (AccType? val){
              setState(() {
                _type = val;
                btnText = "Continue ▶";
              });
            }),
            Text("Merchant"),
            SizedBox(width: 20),
            Radio(value: AccType.individual, groupValue: _type, onChanged: (AccType? val){
              setState(() {
                _type = val;
                btnText = "Create New Account";
              });
            }),
            Text("Individual")
          ], mainAxisAlignment: MainAxisAlignment.center),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){}, child: Text(btnText)),
        ],
      )
      ))
    );
  }
}