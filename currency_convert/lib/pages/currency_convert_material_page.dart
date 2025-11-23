import 'package:flutter/material.dart';

// 1. Create a variable that stores the converted currency value
// 2. Create a function that multiplies the USD to get INR
// 3. Store the value in the vbariable that we created
// 4. Display the variable

class CurrencyConvertMaterialPage extends StatefulWidget {
  const CurrencyConvertMaterialPage({super.key});

  @override
  State<CurrencyConvertMaterialPage> createState() =>
      _CurrencyConvertMaterialPageState();
}

class _CurrencyConvertMaterialPageState
    extends State<CurrencyConvertMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 27, 102),
        title: Text("Currency Convert"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                //result.toString(),
                result.toStringAsFixed(2),
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
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  label: Text(
                    "Please enter the amount in USD",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  prefixIcon: Icon(Icons.attach_money),
                  prefixIconColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final value = double.tryParse(textEditingController.text);
                  if (value == null) return;
                  setState(() {
                    result = (value * (89.62));
                  });
                },

                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue[300]),
                  foregroundColor: WidgetStatePropertyAll(Colors.blue[900]),
                  fixedSize: WidgetStatePropertyAll(Size(300, 50)),
                  shadowColor: WidgetStatePropertyAll(Colors.deepPurple[400]),
                  surfaceTintColor: WidgetStatePropertyAll(
                    Colors.deepPurple[900],
                  ),
                  //shape: WidgetStatePropertyAll(CircleBorder()),
                  elevation: WidgetStatePropertyAll(15),
                ),
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class CurrencyConvertMaterialPagee extends StatelessWidget {
  const CurrencyConvertMaterialPagee ({super.key});
  //If child widget is not const, parent cannot be const
  @override
  Widget build(BuildContext context) {
    
  }
}*/
