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
                  child: Column(
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
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          Container(
            // color: Colors.blue,
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background/porsche.webp')),
            ),
          ),
          Container(
            // color: Colors.blue,
            height: 180,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              // color: Colors.black,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    height: 50,
                    child: Center(
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          childAspectRatio: 5,
                        ),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 209, 209, 209),
                            ),
                            child: Text('# Idea'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 209, 209, 209),
                            ),
                            child: Text('# Fluxiv Pixon'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: const ListTile(
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text('Titulo 1',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      subtitle: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus egestas arcu, ultricies in in lacinia odio. Augue blandit tortor suspendisse eu pharetra felis bibendum turpis. Magna volutpat euismod sagittis ut. Lectus ...'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
