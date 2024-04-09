import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nya_auction/next_player.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/category.png"),
              fit: BoxFit.fill,
            )),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: height * 0.08,
                  left: width * 0.15,
                  child: SizedBox(
                    width: 300,
                    height: 80,
                    // color: Colors.red,
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            () => const NextPlayerPage(title: 'Test', pType: 0),
                            transition: Transition.rightToLeft);
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: height * 0.08,
                  left: width * 0.4,
                  child: SizedBox(
                    width: 300,
                    height: 80,
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            () => const NextPlayerPage(title: 'Test', pType: 1),
                            transition: Transition.rightToLeft);
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: height * 0.08,
                  left: width * 0.65,
                  child: SizedBox(
                    width: 300,
                    height: 80,
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            () => const NextPlayerPage(title: 'Test', pType: 2),
                            transition: Transition.rightToLeft);
                      },
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
