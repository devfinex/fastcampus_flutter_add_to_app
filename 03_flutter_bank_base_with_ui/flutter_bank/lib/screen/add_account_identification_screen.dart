import 'package:flutter/material.dart';
import 'package:flutter_bank/screen/add_account_result_screen.dart';

class AddAccountIdentificationScreen extends StatelessWidget {
  const AddAccountIdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("신분증 제출"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AddAccountResultScreen()));
            },
            child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                height: 70,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('모바일 운전면허증'), Text('>')],
                )),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AddAccountResultScreen()));
            },
            child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                height: 70,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('주민등록증/운전면허증'), Text('>')],
                )),
          )
        ],
      ),
    );
  }
}
