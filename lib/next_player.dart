import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nya_auction/image_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NextPlayerPage extends StatefulWidget {
  const NextPlayerPage({Key? key, required this.title, required this.pType})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int pType;

  @override
  State<NextPlayerPage> createState() => _NextPlayerPageState();
}

class _NextPlayerPageState extends State<NextPlayerPage> {
  TextEditingController rcb = TextEditingController();
  TextEditingController csk = TextEditingController();
  TextEditingController mi = TextEditingController();
  TextEditingController rr = TextEditingController();
  TextEditingController dc = TextEditingController();
  TextEditingController srh = TextEditingController();
  TextEditingController nextPlayer = TextEditingController();
  FocusNode nplayer = FocusNode();
  late SharedPreferences prefs;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      rcb.text = value.getString('rcb') ?? "";
      mi.text = value.getString('mi') ?? "";
      dc.text = value.getString('dc') ?? "";
      csk.text = value.getString('csk') ?? "";
      rr.text = value.getString('rr') ?? "";
      srh.text = value.getString('srh') ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          Get.back();
        }
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/bg/select.png"),
              fit: BoxFit.fill,
            )),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: height * 0.09,
                  right: width * 0.175,
                  child: SizedBox(
                    // padding: const EdgeInsets.all(8),
                    width: 350,
                    // height: 250,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: nextPlayer,
                      focusNode: nplayer,
                      onChanged: (v) {},
                      onFieldSubmitted: (v) {
                        Get.to(
                                () => PlayerViewer(
                                      playerNumber: v,
                                      playerType: widget.pType,
                                    ),
                                transition: Transition.rightToLeft)
                            ?.then((value) => nplayer.requestFocus());
                      },
                      maxLength: 2,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                      ],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counterText: ''),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 180,
                          letterSpacing: 5,
                          fontFamily: 'nya',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.412,
                  left: width * 0.35,
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
                  top: height * 0.412,
                  left: width * 0.05,
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
                  top: height * 0.865,
                  left: width * 0.35,
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: dc,
                      onChanged: (v) {
                        prefs.setString('dc', v);
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
                  top: height * 0.865,
                  left: width * 0.05,
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
                  top: height * 0.865,
                  left: width * 0.2,
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
                  top: height * 0.412,
                  left: width * 0.2,
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: rr,
                      onChanged: (v) {
                        prefs.setString('rr', v);
                      },
                      maxLength: 4,
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
      ),
    );
  }
}
