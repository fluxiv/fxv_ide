import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fxv_ide/modals/country.dart';
// import 'package:http/http.dart' as http;

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

// Future<Album> fetchAlbum() async {
//   final response = await http.get(
//       Uri.parse('https://servicodados.ibge.gov.br/api/v1/paises/{paises} '));

//   if (response.statusCode == 200) {
//     // print(response.body);

//     return Album.fromJson(jsonDecode(response.body[0]));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

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
              // height: 600,
              padding: const EdgeInsets.fromLTRB(45, 70, 30, 40),
              // child: SingleChildScrollView(
              // child: Container(
              // padding: const EdgeInsets.fromLTRB(45, 25, 45, 10),
              child: const Form()),
          // ),
          // ),
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
        const SizedBox(height: 25.0),
        const SizedBox(
          width: 350,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt non porttitor hac bibendum nulla dolor. Adipiscing pulvinar ac aliquet ornare. Nulla proin arcu, scelerisque non porttitor lorem.'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
        ),
        SizedBox(
          height: 245,
          width: 365,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 167.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 167.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Last Name",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Birthday",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: TextFormField(
                          // ignore: unnecessary_const
                          decoration: const InputDecoration(
                              hintText: "Repeat Password",
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),

                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Country',
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          items: list.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: ((value) => {}),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 350.0,
                        child: ElevatedButton(
                          onPressed: () => {},
                          // ignore: sort_child_properties_last
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Color(0xff30AAD8)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffdbdbdb),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
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
