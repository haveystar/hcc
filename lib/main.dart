import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

enum GenderList { male, female }

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  GenderList _gender;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new Text(
                'User name:',
                style: TextStyle(fontSize: 20.0),
              ),
              new TextFormField(
                validator: (value) {
                  if (value.isEmpty) return 'Please, enter your name.';
                },
              ),
              new SizedBox(height: 20.0),
              new Text(
                'Email:',
                style: TextStyle(fontSize: 20.0),
              ),
              new TextFormField(
                validator:
                    EmailValidator(errorText: 'enter a valid email address'),
              ),
              new SizedBox(height: 20.0),
              new Text(
                'Your sex:',
                style: TextStyle(fontSize: 20.0),
              ),
              new RadioListTile(
                  title: Text('Male'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  }),
              new RadioListTile(
                  title: Text('Female'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  }),
              new SizedBox(height: 20.0),
              new RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Color color = Colors.green;
                    String text;
                    if (_gender == null) {
                      text = 'Check sex';
                      color = Colors.red;
                    } else {
                      text = 'Success';
                      color = Colors.green;
                    }

                    Scaffold.of(context).showSnackBar(new SnackBar(
                        content: Text(text), backgroundColor: color));
                  }
                },
                child: Text('Check'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: new AppBar(title: new Text('New Project')),
          body: new MyForm()),
    ));
