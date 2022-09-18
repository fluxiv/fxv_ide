import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
          elevation: 15,
          child: Container(
            padding: const EdgeInsets.fromLTRB(64, 70, 64, 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Your Place\nto...',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        fontFamily: 'Heebo',
                        height: 0.9)),
                const Text('Talk',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xff30AAD8),
                        fontSize: 80,
                        fontFamily: 'Heebo')),
                const SizedBox(
                  width: 320,
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt non porttitor hac bibendum nulla dolor. Adipiscing pulvinar ac aliquet ornare. Nulla proin arcu, scelerisque non porttitor lorem. Est vulputate molestie pretium mi. Nisl, tempus amet mi phasellus. Purus tincidunt eget hendrerit amet. Volutpat massa quis curabitur sodales egestas.'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 24),
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/sign-in'),
                          // ignore: sort_child_properties_last
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xff30AAD8),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffdbdbdb),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/sign-up'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff30AAD8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
