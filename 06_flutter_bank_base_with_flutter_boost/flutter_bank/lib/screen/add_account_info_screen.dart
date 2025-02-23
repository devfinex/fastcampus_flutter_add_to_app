import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAccountInfoScreen extends StatefulWidget {
  const AddAccountInfoScreen({super.key});

  @override
  State<StatefulWidget> createState() => AddAccountInfoState();
}

class AddAccountInfoState extends State<AddAccountInfoScreen> {
  final _channel = const MethodChannel('flutter_bank');
  final _textEditingController = TextEditingController();
  VoidCallback? eventListener;

  @override
  void initState() {
    _textEditingController.text = "";
    eventListener =
        BoostChannel.instance.addEventListener("info", (key, arguments) async {
      String accountNo = _textEditingController.text.trim();
      String password = arguments["password"] ?? "";

      if (accountNo.isNotEmpty && password.isNotEmpty) {
        BoostNavigator.instance.push('identification', arguments: {
          "accountNo": accountNo,
          "password": password,
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    eventListener?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("입출금통장 개설"),
        actions: [
          TextButton(
            child: const Text('취소'),
            onPressed: () {
              _channel.invokeMethod("pop");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.white,
              height: 70,
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '계좌번호',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    //  when the TextFormField in unfocused
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    //  when the TextFormField in focused
                  ),
                ),
              ),
            ),
            Flexible(child: Container()),
            GestureDetector(
                onTap: () async {
                  String accountNo = _textEditingController.text.trim();
                  bool result =
                      await _channel.invokeMethod("checkAccount", accountNo);

                  if (context.mounted) {
                    if (result) {
                      BoostNavigator.instance.push('password', arguments: {
                        'isPresent': true,
                        'isAnimated': true,
                        'accountNo': accountNo,
                      });
                    } else {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Fluttertoast.showToast(
                          msg: "계좌번호를 확인해주세요",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    }
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    color: Colors.amber[600],
                    child: const Text('다음')))
          ],
        ),
      ),
    );
  }
}
