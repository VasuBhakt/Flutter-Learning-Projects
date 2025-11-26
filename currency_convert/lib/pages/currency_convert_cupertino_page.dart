import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConvertCupertinoPage extends StatefulWidget {
  const CurrencyConvertCupertinoPage({super.key});

  @override
  State<CurrencyConvertCupertinoPage> createState() =>
      _CurrencyConvertCupertinoPageState();
}

class _CurrencyConvertCupertinoPageState
    extends State<CurrencyConvertCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
    navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 27, 102),
        middle: const Text("Currency Convert"),
      ),
      backgroundColor: const Color.fromARGB(255, 155, 203, 255),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(25.0),
              child: Text(
                //result.toString(),
                '\u{20B9} ${result.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            //Padding
            // Container
            Padding(
              padding: EdgeInsets.all(40.0),
              child: CupertinoTextField(
                controller: textEditingController,
                decoration: BoxDecoration(
                  color : CupertinoColors.transparent,
                  border : Border.all(),
                  borderRadius: BorderRadius.circular(40)
                ),
                placeholder: "Please enter amount in USD",
                prefix: Icon(CupertinoIcons.money_dollar),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                onPressed: () {
                  final value = double.tryParse(textEditingController.text);
                  if (value == null) return;
                  setState(() {
                    result = (value * (89.62));
                  });
                },
                color: CupertinoColors.systemCyan,
                child: Text(
                  "Convert",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
