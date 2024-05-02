import 'package:flutter/material.dart';

class AddAccountResultScreen extends StatelessWidget {
  const AddAccountResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 70,
              child: const Text(
                '통장 개설완료',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
