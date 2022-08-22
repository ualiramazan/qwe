import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfly/screen_pages/first_page.dart';
import 'package:flutterfly/screen_pages/forth_page.dart';
import 'package:flutterfly/screen_pages/second_page.dart';
import 'package:flutterfly/screen_pages/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    ForthPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            border: Border.all(color: const Color(0xffCCD2E3)),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: CustomBottomNavigationBar(
          iconList: const [
            MyIcons.vector,
            Icons.assessment,
            Icons.article,
            MyIcons.subtract,
          ],
          onChange: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedItem),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  const CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        required this.iconList,
        required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          height: 50,
          width: 50,
          decoration: index == _selectedIndex
              ? const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: Color(0xff247CFF),
            // color: index == _selectedItemIndex ? Colors.green : Colors.white,
          )
              : const BoxDecoration(),
          child: Icon(
            icon,
            color: index == _selectedIndex ? Colors.white : const Color(0xffC4C4C4),
            size: 25,
          ),
        ),
      ),
    );
  }
}

class MyIcons {
  MyIcons._();

  static const _kFontFam = 'MyIcons';
  static const String? _kFontPkg = null;

  static const IconData vector =
  IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData subtract =
  IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
