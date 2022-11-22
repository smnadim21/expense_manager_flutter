import '../../global_import.dart';

class MenuWidget extends StatelessWidget {
  final menus = [
    {"title": "Home", "icon": Icons.home, "route": Routes.home},
    {"title": "Login/Register", "icon": Icons.login, "route": Routes.home},
    {"title": "Search", "icon": Icons.search, "route": Routes.home},
    {},
    {"title": "Log Out", "icon": Icons.one_k, "route": Routes.login, "no_history": true},
  ];

  final headerMenu = Container(
    color: LocalColors.text_blue_light,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/user.png',
            color: LocalColors.text_red,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.contain,
          ),
          Text(
            'Demo +',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: TEXT_DEFAULT),
          ),
          Text(
            "userId : N/A",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black45),
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: getMenus(),
      ),
    ));
  }

  Widget buildListTile(Map data) {
    return data.isEmpty
        ? const Divider(
            height: 1,
            thickness: 1,
          )
        : ListTile(
            leading: Icon(data['icon']),
            title: Text(data['title']),
            onTap: () {
              Navigator.pop(Get.context!);
              if (data['no_history'] ?? false) {
                Get.offAllNamed(data['route']);
              } else {
                Get.toNamed(data['route']);
              }
            },
          );
  }

  List<Widget> getMenus() {
    var menuList = <Widget>[];
    menuList.add(headerMenu);
    menuList.addAll(menus.map((data) => buildListTile(data)).toList());
    return menuList;
  }
}
