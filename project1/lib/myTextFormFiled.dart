import 'package:flutter/material.dart';

class myTextFormFiled extends StatelessWidget{

  String labelText;
  Function validation;
  Function Saving;
  myTextFormFiled({this.labelText,this.validation,this.Saving});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextFormField(decoration: InputDecoration(labelText: labelText),
        validator: (value)=>validation(value),
        onSaved: (newValue)=>Saving(newValue),
      ),
      SizedBox(height: 50,),
    ],);
  }

}