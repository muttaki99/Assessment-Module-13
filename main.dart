import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Bag',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  productItem('Pullover', 'Black', 'L', 51),
                  productItem('T-Shirt', 'Gray', 'L', 30),
                  productItem('Sport Dress', 'Black', 'M', 43),
                ],
              ),
            ),
            const SizedBox(height: 16),
            totalAmount(),
            const SizedBox(height: 16),
      ElevatedButton( onPressed: (){
      const snackBar =  SnackBar(
        content: Text('Congratulations!'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        padding:  const EdgeInsets.symmetric(vertical: 16),
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
    )
          ],
        ),
      ),
    );
  }

}

Widget productItem(String name, String color, String size, int price) {

  return Container(
    margin:  const EdgeInsets.only(bottom: 16),
    padding:  const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 20,
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
                style:  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text('Color: $color  Size: $size',),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon:  const Icon(Icons.remove),
                  onPressed: () {},
                ),
                 const Text("1"),
                IconButton(
                  icon:  const Icon(Icons.add),
                  onPressed: (){},
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


Widget totalAmount() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Total amount:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Text(
        '\$124',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

