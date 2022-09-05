import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
          elevation: 15,
          child: Container(
            padding: const EdgeInsets.fromLTRB(2, 40, 2, 40),
            child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(64, 25, 64, 60),
                  child: const Form()),
            ),
          ),
        )
      ],
    );
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Sign up',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
              fontFamily: 'Heebo',
              height: 0.9),
        ),
        const Text(
          'Welcome!',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xff30AAD8),
              fontSize: 15,
              fontFamily: 'Heebo'),
        ),
        SizedBox(height: 25.0),
        const SizedBox(
          width: 350,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt non porttitor hac bibendum nulla dolor. Adipiscing pulvinar ac aliquet ornare. Nulla proin arcu, scelerisque non porttitor lorem.'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        ),
        Container(
          height: 500,
          width: 350,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: const <Widget>[
                      SizedBox(
                        width: 167.0,
                        child: TextField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 167.0,
                        child: TextField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Last Name",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: TextField(
                            // ignore: unnecessary_const
                            decoration: const InputDecoration(
                                hintText: "Birthday",
                                border: OutlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.all(15)),

                            style: TextStyle(fontSize: 15.0),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: TextField(
                            // ignore: unnecessary_const
                            decoration: const InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.all(15)),

                            style: TextStyle(fontSize: 15.0),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Repeat Password",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
