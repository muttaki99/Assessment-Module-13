import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBagScreen(),
    );
  }
}

class MyBagScreen extends StatefulWidget {
   const MyBagScreen({super.key});

  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  int pulloverQty = 1;
  int tshirtQty = 1;
  int sportDressQty = 1;

  int pulloverPrice = 51;
  int tshirtPrice = 30;
  int sportDressPrice = 43;

  int getTotalAmount() {
    return (pulloverQty * pulloverPrice) +
        (tshirtQty * tshirtPrice) +
        (sportDressQty * sportDressPrice);
  }

  void _showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Congratulations!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  productItem('Pullover', 'Black', 'L', pulloverPrice, pulloverQty, (newQty) {
                    setState(() {
                      pulloverQty = newQty;
                    });
                  }),
                  productItem('T-Shirt', 'Gray', 'L', tshirtPrice, tshirtQty, (newQty) {
                    setState(() {
                      tshirtQty = newQty;
                    });
                  }),
                  productItem('Sport Dress', 'Black', 'M', sportDressPrice, sportDressQty, (newQty) {
                    setState(() {
                      sportDressQty = newQty;
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            totalAmount(getTotalAmount()),
            const SizedBox(height: 16),
            checkoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget productItem(String name, String color, String size, int price, int qty, Function(int) onQtyChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'lib/Images/flutter_t-shirt.jpeg',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text('Color: $color  Size: $size'),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (qty > 1) {
                        onQtyChanged(qty - 1);
                      }
                    },
                  ),
                  Text('$qty'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      onQtyChanged(qty + 1);
                    },
                  ),
                ],
              ),
              Text('\$$price', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget totalAmount(int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total amount:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$$total',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget checkoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showSnackBar(context);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Center(
        child: Text(
          'CHECK OUT',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}

