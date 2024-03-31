import 'package:flutter/material.dart';

class hesapmakinesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Uygulama Çerçevesi', home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Boş Uygulama Çerçevesi")),
      body: hesapmakinesiBody(),
    );
  }
}

class hesapmakinesiBody extends StatefulWidget {
  @override
  hesapmakinesiBodyState createState() {
    return hesapmakinesiBodyState();
  }
}

class hesapmakinesiBodyState extends State<hesapmakinesiBody> {
  num firstNum = 0, secondNum = 0, result = 0;
  TextEditingController firstNumControl = TextEditingController(
    text: "0",
  );
  TextEditingController secondNumControl = TextEditingController(
    text: "0",
  );

  sum() {
    setState(() {
      firstNum = num.parse(firstNumControl.text);
      secondNum = num.parse(secondNumControl.text);
      result = firstNum + secondNum;
    });
  }

  minus() {
    setState(() {
      firstNum = num.parse(firstNumControl.text);
      secondNum = num.parse(secondNumControl.text);
      result = firstNum - secondNum;
    });
  }

  multip() {
    setState(() {
      firstNum = num.parse(firstNumControl.text);
      secondNum = num.parse(secondNumControl.text);
      result = firstNum * secondNum;
    });
  }

  divide() {
    setState(() {
      firstNum = num.parse(firstNumControl.text);
      secondNum = num.parse(secondNumControl.text);
      result = firstNum / secondNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result.toString()),
            TextFormField(
              controller: firstNumControl,
            ),
            TextFormField(
              controller: secondNumControl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: sum, child: Text("+")),
                ElevatedButton(onPressed: minus, child: Text("-")),
                ElevatedButton(onPressed: multip, child: Text("*")),
                ElevatedButton(onPressed: divide, child: Text("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
