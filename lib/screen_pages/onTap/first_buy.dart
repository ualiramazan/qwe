import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstBuy extends StatefulWidget {
  const FirstBuy({Key? key}) : super(key: key);

  @override
  State<FirstBuy> createState() => _FirstBuyState();
}

class _FirstBuyState extends State<FirstBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.pink
        ),
      ),
    );
  }
}
