import '../../../../global_import.dart';
import '../controllers/_controller.dart';

class DemoView extends GetView<DemoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABC Drivers+"),
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
     /*       loginButtonWidget(),*/
          ],
        ),
      ),
    );
  }


}


