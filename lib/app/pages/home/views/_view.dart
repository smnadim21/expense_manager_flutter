import '../../../../global_import.dart';
import '../../../ui/widgets.dart';
import '../controllers/_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var con = controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 64.0),
        decoration: const BoxDecoration(color: BACKGROUND),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/user.png',
                width: 200.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(onPressed: () {
            controller.test();
            }, child: const Text("TEST"))
            /*       loginButtonWidget(),*/
          ],
        ),
      ),
      drawer: MenuWidget(),
    );
  }
}
