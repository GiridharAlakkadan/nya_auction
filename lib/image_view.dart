import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlayerViewer extends StatefulWidget {
  final String playerNumber;
  final int playerType; //0 icon, 1 keeper, 2 player
  const PlayerViewer(
      {Key? key, required this.playerNumber, required this.playerType})
      : super(key: key);

  @override
  State<PlayerViewer> createState() => _PlayerViewerState();
}

class _PlayerViewerState extends State<PlayerViewer> {
  @override
  Widget build(BuildContext context) {
    String pType = widget.playerType == 0
        ? 'Icon'
        : widget.playerType == 1
            ? 'Keeper'
            : 'Player';
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          Get.back();
        }
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              title: Text(
                '$pType ${widget.playerNumber}',
                style: const TextStyle(
                    // fontSize: 40,
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'nya',
                    fontWeight: FontWeight.w600),
              ),
            ),
            backgroundColor: Colors.black,
            body: Image.asset(
              getSrcFromNoAndType(widget.playerType, widget.playerNumber),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Container(
                    height: 300,
                    // width: 300,
                    color: Colors.red,
                    child: const Center(
                        child: Text('Image Not Found',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                letterSpacing: 5,
                                fontFamily: 'nya',
                                fontWeight: FontWeight.w600))),
                  ),
                );
              },
            )),
      ),
    );
  }

  String getSrcFromNoAndType(int type, String no) {
    String src = '';
    src = 'assets/players/${widget.playerNumber}.png';
    return src;
    // if (type == 0) {
    //   src = 'assets/icons/I${widget.playerNumber}.png';
    // } else if (type == 1) {
    //   src = 'assets/keepers/K${widget.playerNumber}.png';
    // } else {
    //   src = 'assets/players/P${widget.playerNumber}.png';
    // }
    // return src;
  }
}
