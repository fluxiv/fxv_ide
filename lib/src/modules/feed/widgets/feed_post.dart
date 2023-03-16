import 'package:flutter/material.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(10.0),
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      // alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            // color: Color.fromARGB(255, 178, 178, 178),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            height: 50,
            child: Row(
              children: [
                Container(
                  // color: Color.fromARGB(255, 0, 0, 0),
                  width: 60,
                  child: const Center(
                    child: InkWell(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 45,
                      ),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.green,
                  width: 315,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Igor Suzart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        "Open Source Enstusiast",
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.green,
                  width: 100,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                    ),
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 5),
                    children: const [
                      Icon(Icons.star),
                      Icon(Icons.share),
                      Icon(Icons.more_vert),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black12,
          ),
          Container(
            // color: Colors.blue,
            height: 50,
          ),
        ],
      ),
    );
  }
}
