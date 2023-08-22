import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global_import.dart';
import '../../../ui/widgets.dart';
import '../controllers/_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var con = controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Manager"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.currency_exchange)),
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Platform.isAndroid ? Icons.more_vert : Icons.more_horiz),
              );
            }
          ),

        ],
        backgroundColor: LocalColors.bg,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: BACKGROUND),
        child: Column(
          children: [
            Expanded(child: ListView()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(40),
                        backgroundColor: LocalColors.bg_succesg_light,
                        // <-- Button color
                        foregroundColor: Colors.white, // <-- Splash color
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: LocalColors.bg_success,
                        size: 40,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(40),
                        backgroundColor: LocalColors.bg_danger_light,
                        // <-- Button color
                        foregroundColor: Colors.white, // <-- Splash color
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.minus,
                        color: LocalColors.bg_danger,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: MenuWidget(),
      endDrawer: EndMenuWidget(),
    );
  }
}
