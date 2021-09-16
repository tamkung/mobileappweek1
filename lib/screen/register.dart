import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, lastname, email, password, confirmpass;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Regsiter'),
          backgroundColor: pColor,
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtLastname(),
                txtEmail(),
                txtPass(),
                txtConfirmPass(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(Icons.account_circle),
          hintText: 'Input your name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนข้อมูล';
          } else if (value.length < 6) {
            return 'กรุณาป้อนข้อมูลมากกว่า 6 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value!.trim();
        },
      ),
    );
  }

  Widget txtLastname() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'LastName',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your lastname',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนข้อมูล';
          } else if (value.length < 6) {
            return 'กรุณาป้อนข้อมูลมากกว่า 6 ตัวอักษร';
          }
        },
        onSaved: (value) {
          lastname = value!.trim();
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'E-mail',
          icon: Icon(Icons.email),
          hintText: 'Input your email',
        ),
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณาป้อนข้อมูลตามรูปแบบอีเมล';
          } else if (!(value.contains('.'))) {
            return 'กรุณาป้อนข้อมูลตามรูปแบบอีเมล';
          }
        },
        onSaved: (value) {
          email = value!.trim();
        },
      ),
    );
  }

  Widget txtPass() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.lock),
          hintText: 'Input your password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนรหัสผ่าน';
          }
        },
        onChanged: (value) => password = value,
        onSaved: (value) {
          password = value!.trim();
        },
      ),
    );
  }

  Widget txtConfirmPass() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          icon: Icon(Icons.lock),
          hintText: 'Input your password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนรหัสผ่าน';
          } else if (value != password) {
            return 'กรุณาป้อนรหัสผ่านให้ครงกัน';
          }
        },
        onSaved: (value) {
          confirmpass = value!.trim();
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: tColor,
        ),
        onPressed: () {
          print('Hello World');
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('Name : $name');
            print('Lastname : $lastname');
            print('Email : $email');
            print('Password : $confirmpass');
            formKey.currentState!.reset();
          }
        },
        child: Text('Submit'),
      );
}
