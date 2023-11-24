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
      title: 'Kick Bazaar',
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Kick Bazaar",
          style: TextStyle(
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.purple,
                  Colors.red,
                ], // Replace with your gradient colors
              ).createShader(const Rect.fromLTWH(
                  90.0, 100.0, 130.0, 50.0)), // Adjust the Rect size as needed
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 24,
          ),
        ),
        leadingWidth: 60,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                    Colors.purple,
                    Colors.red,
                  ], // Replace with your gradient colors
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.local_mall,
                color: Colors.white,
                size: 34,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckoutPage()),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_checkout_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
                if (basket.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8.2,
                      child: Text(
                        basket.length.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                else
                  const Center()
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        size: 28,
                      )),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
