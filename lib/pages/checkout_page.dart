import 'package:flutter/material.dart';

import 'lists.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Kick Bazaar Basket",
          style: TextStyle(fontSize: 21),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 15),
              itemCount: basket.length,
              itemBuilder: (context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(basket[index][2]),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        basket[index][0],
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        basket[index][1],
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text("Size: ${basket[index][3]}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child:
                                          Text("Price: €${basket[index][4]}"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: basket.isNotEmpty
                    ? SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.payment),
                              Text("Checkout"),
                            ],
                          ),
                          onPressed: () {
                            basket.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Order placed successfully!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                duration: Duration(
                                    seconds:
                                        2), // Adjust the duration as needed
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.74),
                        child: const Center(
                          child: Text(
                            "Your basket is empty.",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
