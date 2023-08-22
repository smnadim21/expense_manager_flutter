import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../global_import.dart';

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String accountName;
  final String currencyName;
  final String? balance;
  final GestureTapCallback? onTap;

  const AccountItem({super.key,
    required this.icon,
    required this.accountName,
    required this.currencyName,
    this.balance = "0.00", this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.colorPrimaryBg,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColor.colorPrimary,
                size: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountName,
                    style: const TextStyle(
                        color: AppColor.colorPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: currencyName,
                            style: Get.theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 8,
                            )),
                        TextSpan(
                            text: "$balance",
                            style: Get.theme.textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.colorPrimary))
                      ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridIconItem extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final Color? background;
  final double? iconSize;
  final Color? shadowColor;

  const GridIconItem({super.key,
    this.icon,
    this.iconColor,
    this.shadowColor,
    this.iconSize,
    this.background});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: background ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColor.colorPrimary,
              blurStyle: BlurStyle.normal,
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(-1, 1), // Shadow position
            ),
          ],
        ),
        child: Icon(
          icon ?? FontAwesomeIcons.dollarSign,
          size: iconSize ?? (MediaQuery
              .of(context)
              .size
              .width - 72) / 6,
          color: iconColor ?? AppColor.colorPrimary,
        ),
      ),
    );
  }
}

class EndMenuListTile extends StatelessWidget {
  final Map data;
  final GestureTapCallback? onTap;

  const EndMenuListTile({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.colorPrimaryBg,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                data['icon'],
                size: 32,
                color: AppColor.colorPrimary,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['title'],
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: themeColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
