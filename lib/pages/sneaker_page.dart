import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'functions.dart';

class SneakerPage extends StatefulWidget {
  const SneakerPage(
      {super.key,
      required this.index,
      required this.brand,
      required this.description,
      required this.model,
      required this.price,
      required this.imageURL,
      required this.sneakerList});
  final int index;
  final String brand;
  final String model;
  final String description;
  final int price;
  final String imageURL;
  final List sneakerList;

  @override
  State<SneakerPage> createState() => _SneakerPageState();
}

bool addedToBasket = false;
int selectedIndex = 4;
List<double> sizes = [
  7.5,
  8.0,
  8.5,
  9.0,
  9.5,
  10.0,
  10.5,
  11.0,
  11.5,
  12.0,
  12.5,
  13.0
];

class _SneakerPageState extends State<SneakerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 5, 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(widget.imageURL),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "${widget.brand} ${widget.model}",
              style:
                  GoogleFonts.prompt(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                widget.description,
                textAlign: TextAlign.start,
                style: GoogleFonts.prompt(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )),
          const Divider(),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                "Select your size :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, int index) => Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        index == selectedIndex ? Colors.red : Colors.black,
                    radius: 25,
                    child: Text(
                      sizes[index].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Text(
            "€ ${widget.price}",
            style:
                GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  addedToBasket = true;
                  addTobag(
                      brand: widget.brand,
                      model: widget.model,
                      imageUrl: widget.imageURL,
                      size: sizes[selectedIndex],
                      price: widget.price);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        children: [
                          TextSpan(
                            text:
                                '${widget.brand} ${widget.model} added to Basket ||',
                            style: const TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '   size: ${sizes[selectedIndex]}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    duration: const Duration(
                        seconds: 1), // Adjust the duration as needed
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_shopping_cart_rounded),
                  Text("Add to Basket"),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
