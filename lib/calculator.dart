import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final TextEditingController _number1Controlller = TextEditingController();
  final TextEditingController _number2Controlller = TextEditingController();

  int _result = 0;

  void add(){
    setState(() {
      int number1 = int.tryParse(_number1Controlller.text) ?? 0 ;
      int number2 = int.tryParse(_number2Controlller.text) ?? 0 ;

      print("$number2 $number2");
      _result = number1 + number2;
    });
  }
  void subtraction(){
    setState(() {
      int number1 = int.tryParse(_number1Controlller.text) ?? 0 ;
      int number2 = int.tryParse(_number2Controlller.text) ?? 0 ;

      _result = number1 - number2;
    });
  }
  void multiply(){
    setState(() {
      int number1 = int.tryParse(_number1Controlller.text) ?? 0 ;
      int number2 = int.tryParse(_number2Controlller.text) ?? 0 ;

      _result = number1 * number2;
    });
  }
  void division(){
    setState(() {
      int number1 = int.tryParse(_number1Controlller.text) ?? 0 ;
      int number2 = int.tryParse(_number2Controlller.text) ?? 0 ;

      double ans = number1 / number2;
      _result = ans.ceil();
    });
  }
  @override
  void dispose() {
    _number1Controlller.dispose();
    _number2Controlller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _number1Controlller,
              decoration: InputDecoration(
                hintText: "Enter First Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(20)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _number2Controlller,
              decoration: InputDecoration(
                  hintText: "Enter First Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(20)
              ),
            ),
            Center(
              child: Text(
                _result.toString(),
                style: TextStyle(
                fontSize: 40
              ),),
            )
          ],
        ),
      ),
       floatingActionButton: Padding(
         padding:const EdgeInsets.symmetric(horizontal: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
                onPressed: add,
                child: const Text("+"),
            ),
            FloatingActionButton(
              onPressed: subtraction ,
              child: const Text("-"),
            ),
            FloatingActionButton(
              onPressed: multiply ,
              child: const Text("*"),
            ),
            FloatingActionButton(
              onPressed: division ,
              child: const Text("/"),
            )
          ],
         ),
       ),
    );
  }
}
