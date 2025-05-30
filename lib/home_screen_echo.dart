import 'package:flutter/material.dart';
import 'package:my_app_1/home_screen.dart';
import 'package:my_app_1/widget/category_widget.dart';

class HomeScreenEcho extends StatefulWidget {
  const HomeScreenEcho({super.key});

  @override
  State<HomeScreenEcho> createState() => _HomeScreenEchoState();
}

class _HomeScreenEchoState extends State<HomeScreenEcho> {
  int selected = 0;
  List<String> categoryDetails = [
    "Home",
    "Song",
    "Albums",
    "Artists",
    "Folders",
    "Playlists",
    "Favourites",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFFC90F), Color(0xffFFE386)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    "EchoTunes",
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xffB96300),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color(0xffDD9828),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: categoryDetails.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      nameCategory: categoryDetails[index],
                      isSelected: selected == index,
                      myOnTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                    );
                  }),
            ),
            Expanded(child: HomeScreen()),
          ],
        ),
      ),
    );
  }
}
