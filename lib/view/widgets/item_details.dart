import 'package:flutter/material.dart';
import 'package:prd/view/theme.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //IconButton(
      //           icon: Icon(Icons.arrow_back, color: KBule),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //
      //         ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: KBule,
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        Icon(Icons.sailing, size: 70),
                        Text(
                          "  text  ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        Icon(Icons.safety_check, size: 70),
                        Text(
                          " Loved by 200 ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height - 220,
                  width: MediaQuery.of(context).size.width - 170,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:  NetworkImage(
                      'https://www.apple.com/in/iphone-14-pro/images/overview/design/design_startframe__cffzwjeyro2q_large.jpg',
                    ),),
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),

                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  " - Iphone 22 Pro Max",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                const Spacer(),
                Text(
                  "550\$ ",
                  style: TextStyle(
                      color: KBule, fontWeight: FontWeight.w500, fontSize: 33),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: KBule,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    height: 69,
                    width: 175,
                    child: const Center(
                        child: Text(
                      'Buy-Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ))),
                const Spacer(),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    height: 69,
                    width: 175,
                    child: const Center(
                        child: Text(
                      'description',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
