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
        backgroundColor: Colors.black,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                            const SizedBox(
                              width: 60,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Size: ${basket[index][3]}"),
                                Text("Price: €${basket[index][4]}")
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              );
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50),
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
                        onPressed: () {},
                      ),
                    )
                  : const Center(
                      child: Text(
                        "Your basket is empty.",
                        style: TextStyle(fontSize: 24),
                      ),
                    )),
        ],
      ),
    );
  }
}
