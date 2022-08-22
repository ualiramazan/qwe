import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutterfly/screen_pages/onTap/first_buy.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.maxFinite,
            color: Colors.blue,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.add_circle, color: Colors.white, size: 60,),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        width: double.maxFinite,
                        height: 300,
                        color: Colors.amber,
                      ));
                },
              ),
            )
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 100,
                width: 150,
                color: Colors.red,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirstBuy()));
                  },
                  child: Center(
                    child: Text('Click'),
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
