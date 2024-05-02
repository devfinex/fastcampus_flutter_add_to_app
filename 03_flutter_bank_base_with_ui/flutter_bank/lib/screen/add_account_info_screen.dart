import 'package:flutter/material.dart';
import 'package:flutter_bank/screen/add_account_identification_screen.dart';

class AddAccountInfoScreen extends StatelessWidget {
  const AddAccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("입출금통장 개설"),
        actions: [
          TextButton(
            child: const Text('취소'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.white,
              height: 70,
              child: const Row(
                children: [
                  Text('계좌 만들기'),
                ],
              )),
          Flexible(child: Container()),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const AddAccountIdentificationScreen()));
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  color: Colors.amber[600],
                  child: const Text('다음')))
        ],
      ),
    );
  }
}
