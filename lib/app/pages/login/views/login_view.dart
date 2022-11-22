import 'package:n_flutter/global_import.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter QuickStart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Open settings',
            onPressed: () {
              Get.toNamed(Routes.home);
            },
          ),
        ],
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
            headlinesWidget(controller),
            Obx(() => Visibility(
                visible: controller.isVisible.isTrue,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 20, right: 16),
                      child: Obx(() => TextFormField(
                            controller: emailTextController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              errorText: controller.userEmailError.value,
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.people,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 10, right: 16),
                      child: TextFormField(
                        obscureText: true,
                        controller: passWordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: controller.userPassError.value,
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.password,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {

                              FocusManager.instance.primaryFocus?.unfocus();
                              // Respond to button press
                              if (emailTextController.text.isEmpty) {
                                controller.userEmailError.value = "Please insert userId";
                                return;
                              }
                              controller.userEmailError.value = null;
                              if (passWordController.text.isEmpty) {
                                controller.userPassError.value = "Password field is empty";
                                return;
                              }
                              controller.userPassError.value = null;
                              controller.authService.loggedIn = true;
                              Get.toNamed(Routes.home);

                             // controller.startAnimation();
                              //  DriverLoginResponse d = await controller.api.login(emailTextController.text);
                /*              await controller.api
                                  .login(emailTextController.text, passWordController.text)
                                  .then((value) => handleLogin(value));*/
                             // controller.stopAnimation();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              padding: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))),
           /* Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Obx(() {
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: [],
                );
              }),
            ),*/
          ],
        ),
      ),
    );
  }


}

Widget headlinesWidget(LoginController controller) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Obx(() => Text(
                controller.loginText.value,
                textAlign: TextAlign.center,
                style: const TextStyle(letterSpacing: 1.5, fontSize: 28.0, fontWeight: FontWeight.bold, color: themeColor),
              )),
        )
      ],
    ),
  );
}
