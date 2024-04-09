import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nya_auction/category.dart';
import 'package:nya_auction/next_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('NPL 4');
    setWindowMinSize(const Size(1450, 920));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NSL',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NPL Auction 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Real Madrid
  TextEditingController rcb = TextEditingController();

  /// Manchester City
  TextEditingController csk = TextEditingController();

  /// FC Barcelona
  TextEditingController mi = TextEditingController();

  /// Arsenal
  TextEditingController rr = TextEditingController();

  /// AC Milan
  TextEditingController dc = TextEditingController();
  TextEditingController srh = TextEditingController();
  // TextEditingController nextPlayer = TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      getDBData(value);
    });
    super.initState();
  }

  getDBData(value) {
    rcb.text = value.getString('rcb') ?? ""; //RM
    mi.text = value.getString('mi') ?? ""; //FCB
    dc.text = value.getString('dc') ?? ""; // ACM
    csk.text = value.getString('csk') ?? ""; //MCT
    rr.text = value.getString('rr') ?? ""; // ARS
    srh.text = value.getString('srh') ?? ""; // ARS
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Get.to(() => const NextPlayerPage(title: 'Test', pType: 2),
                    transition: Transition.rightToLeft)
                ?.then((value) => getDBData(prefs));
          },
          child: const Icon(Icons.keyboard_arrow_right),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg/purse.png"),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: height * 0.835,
                left: width * 0.36,
                child: SizedBox(
                  // padding: const EdgeInsets.all(8),
                  width: 250,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: rcb,
                    onChanged: (v) {
                      prefs.setString('rcb', v);
                    },
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: InputBorder.none, counterText: ''),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.835,
                left: width * 0.055,
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: mi,
                    onChanged: (v) {
                      prefs.setString('mi', v);
                    },
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    decoration: const InputDecoration(
                        border: InputBorder.none, counterText: ''),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.835,
                left: width * 0.21,
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: rr,
                    onChanged: (v) {
                      prefs.setString('rr', v);
                    },
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    decoration: const InputDecoration(
                        border: InputBorder.none, counterText: ''),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.835,
                left: width * 0.51,
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: csk,
                    onChanged: (v) {
                      prefs.setString('csk', v);
                    },
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    decoration: const InputDecoration(
                        border: InputBorder.none, counterText: ''),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.835,
                left: width * 0.66,
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: srh,
                    onChanged: (v) {
                      prefs.setString('srh', v);
                    },
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    decoration: const InputDecoration(
                        border: InputBorder.none, counterText: ''),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.835,
                left: width * 0.815,
                child: SizedBox(
                  // color: Colors.white,
                  width: 250,
                  child: TextFormField(
                    maxLength: 4,
                    controller: dc,
                    onChanged: (v) {
                      prefs.setString('dc', v);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        letterSpacing: 5,
                        fontFamily: 'nya',
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
