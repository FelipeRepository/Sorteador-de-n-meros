import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final txtController = TextEditingController();
  final txtLimitsNumberController = TextEditingController();
  String message = "";
  List<int> numbers = [];
  
  int countClick = 0;
void generateNumbers() {
  if (countClick > 0) {
    numbers = [];
    countClick = 0;
  }
  countClick++;

  int totalNumbers = int.parse(txtController.text);
  int limitsNumber = int.parse(txtLimitsNumberController.text);

  Set<int> uniqueNumbers = <int>{};

  while (uniqueNumbers.length < totalNumbers) {
    int number = Random().nextInt(limitsNumber + 1);
    if(number == 0) {
      continue;
    } else {
     uniqueNumbers.add(number);
    }
  }
  numbers = uniqueNumbers.toList();
  setState(() {
    message = numbers.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: Column(
      
          children: [
            Center(
              child: SizedBox(
              width: mediaquery.width * 95/100,
              height: mediaquery.height * 5/100,
              child: const FittedBox(child: Text("quantidade de números para serem gerados"))),
            ),
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: mediaquery.height * 7/100,
                child: TextField(
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(width: 20)),
                  ),
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: mediaquery.height * 2/100
                  ),
                  keyboardType: TextInputType.number,
                  controller: txtController,
                ),
              ),
            ),
             Center(
              child: SizedBox(
              width: mediaquery.width * 95/100,
              height: mediaquery.height * 5/100,
              child: const FittedBox(child: Text("limites para até que número vai o sorteio"))),
            ),
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: mediaquery.height * 7/100,
                child: TextField(
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(width: 20)),
                  ),
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: mediaquery.height * 2/100
                  ),
                  keyboardType: TextInputType.number,
                  controller: txtLimitsNumberController,
                ),
              ),
            ),            
                       
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(color: const Color.fromARGB(255, 154, 93, 225),
                borderRadius: BorderRadius.circular(10)),
                height: mediaquery.height * 7/100,
                 child: InkWell(
                   
                   onTap: generateNumbers,
                   child:  const Center(child: FittedBox(
                     fit: BoxFit.contain,
                     child: Text("Gerar Números", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),))),
                 )),
              ),
                Center(
              child: SizedBox(
              width: mediaquery.width * 95/100,
              height: mediaquery.height * 5/100,
              child:  FittedBox(child: Text(
                message
                ))),
            ),
          ],
        ),
      ),
    );
  }
}