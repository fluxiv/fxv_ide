import 'package:flutter/material.dart';

class PicSection extends StatelessWidget {
  const PicSection({super.key});

  @override
  Widget build(BuildContext context) {
    String userPhoto = "/uploads/default/avatar-image.jpg";
    List<Map> listItems = [
      {"name": "Point System", "icon": Icons.add_chart_outlined},
      {"name": "Groups", "icon": Icons.group_sharp},
      {"name": "Events", "icon": Icons.details},
      {"name": "Design", "icon": Icons.add_chart_outlined},
      {"name": "Dev", "icon": Icons.devices_rounded},
    ];

    return Container(
      clipBehavior: Clip.hardEdge,
      height: 428,
      // height: MediaQuery.of(context).size.height / 1.8,
      width: 320,
      // width: MediaQuery.of(context).size.width / 4.5,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: Colors.black12)),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background/porsche.webp')),
            ),
            child: Center(
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.white,
                    ),
                    // child: Image.network(
                    //     'http://localhost:4040/user/getImage?photo=${userPhoto}'),
                  ),
                  const Text(
                    'Vagner Lopes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const Text(
                    'Entusiasta de carros',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(13, 8, 0, 8),
              child: Text(
                'Menu',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Row(
                      children: [
                        Icon(listItems[index]["icon"]),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            listItems[index]["name"],
                            // textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black12,
                  );
                },
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
