import 'package:flutter/material.dart';
import 'package:project1/data/database_helper.dart';
import 'package:project1/models/user.dart';
import 'package:project1/models/user.dart';

import 'login.dart';
import 'main_merchantScreen.dart';
import 'models/order.dart';



class NewProduct extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState  extends State<NewProduct> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _id, _name, _price,_category,_description;

  void _mainMerchantScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainMerchantScreen('Merchant'),));
  }


  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Add Product"),
      color: Colors.green,
    );


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Register",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(labelText: "Name"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _price = val,
                  decoration: new InputDecoration(labelText: "Price"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _category = val,
                  decoration: new InputDecoration(labelText: "Category"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) =>_description = val,
                  decoration: new InputDecoration(labelText: "Description"),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit(){
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var order = new Order(_id, _name, _price, _category,_description);
        var db = new DatabaseHelper();
        db.saveOrder(order);
        _isLoading = false;
        _mainMerchantScreen();
      });
    }
  }
}