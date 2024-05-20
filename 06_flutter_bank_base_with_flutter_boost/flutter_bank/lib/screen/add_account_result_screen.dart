import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAccountResultScreen extends StatefulWidget {
  const AddAccountResultScreen({
    super.key,
    required this.accountNo,
  });

  final String accountNo;

  @override
  State<StatefulWidget> createState() => AddAccountResultState();
}

class AddAccountResultState extends State<AddAccountResultScreen> {
  final _channel = const MethodChannel('flutter_bank');
  String resultMsg = '';

  @override
  void initState() {
    _channel.invokeMethod("makeAccount", widget.accountNo).then((value) {
      setState(() {
        if (value is bool && value) {
          resultMsg = '통장 개설완료';
        } else {
          resultMsg = '통장 개설실패';
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _channel.invokeMethod("pop");
            },
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
              child: Text(
                resultMsg,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
