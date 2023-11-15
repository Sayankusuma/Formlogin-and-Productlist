import 'package:flutter/material.dart';
import 'package:flutter_tugaspemmob/dataproduck.dart';

class desainlogin extends StatefulWidget {
  const desainlogin({Key? key}) : super(key: key);

  @override
  State<desainlogin> createState() => _desainloginState();
}

class _desainloginState extends State<desainlogin> {
  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
            child: Container(
          width: 290,
          height: 290,
          child: Card(
              elevation: 10,
              shadowColor: Colors.lightBlue,
              color: Color.fromARGB(255, 44, 143, 192),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  TextFormField(
                    controller: cUser,
                    decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Input user Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'User Masih Kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: cPass,
                    decoration: InputDecoration(
                        labelText: 'Your Password',
                        hintText: 'Input Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password Masih Kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String tUser = 'admin';
                        String tPass = '1234';
                        if (formkey.currentState!.validate()) {
                          if (cUser.text == tUser && cPass.text == tPass) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                                (route) => false);
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Konfirmasi Login'),
                                    content:
                                        Text('User atau Password kamu salah'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            cUser.text = '';
                                            cPass.text = '';
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Ok'))
                                    ],
                                  );
                                });
                          }
                        }
                      },
                      child: Text('Login'))
                ]),
              )),
        )),
      ),
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
    );
  }
}
