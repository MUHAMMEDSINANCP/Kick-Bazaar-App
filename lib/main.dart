import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kick_bazaar_app/pages/checkout_page.dart';
import 'package:kick_bazaar_app/pages/list_builder.dart';
import 'package:kick_bazaar_app/pages/lists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 40,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_list)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CheckoutPage()),
                              );
                            },
                            icon: const Icon(Icons.shopping_bag)),
                        if (basket.isNotEmpty)
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 7.5,
                            child: Text(
                              basket.length.toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          )
                        else
                          const Center()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Jordans",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 300,
            child: SneakerList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Air Force 1",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 300,
            child: AirforceList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dunks",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 300,
            child: DunksList(),
          )
        ],
      ),
    );
  }
}
