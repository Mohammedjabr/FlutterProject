import 'package:flutter/material.dart';
import 'main.dart';
import 'newProduct.dart';
import 'ordersScreen.dart';

class mainMerchantScreen extends StatefulWidget {
  String tilte;
  mainMerchantScreen(this.tilte);
  @override
  _mainMerchantScreenState  createState() => _mainMerchantScreenState();
}

class _mainMerchantScreenState extends State<mainMerchantScreen> {


  newProduct(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewProduct(),));
  }

//  OrdersScreen(){
//    Navigator.push(context, MaterialPageRoute(builder: (context) => orderScreen(),));
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              FlatButton(color:Colors.blue,textColor: Colors.white,onPressed:()=>newProduct(),child: Text('New Product',style: TextStyle(fontSize: 45)),),
              SizedBox(height: 50,),
              FlatButton(color:Colors.blue,textColor: Colors.white,onPressed:()=>newProduct(),child: Text('Orders',style: TextStyle(fontSize: 45,color: Colors.white)),)
            ],)

          ,
        ),
      ),
    );
  }


}