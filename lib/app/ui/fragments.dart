import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/entity.dart';
import '../../tools/colors/color_const.dart';
import '../../tools/icon/icons_const.dart';
import '../pages/home/controllers/_controller.dart';
import 'list_items.dart';
import 'theme_widgets.dart';

class AccountsView extends GetView<HomeController> {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    IconData iconData = accountsIconList.first;
    RxBool addAccounts = RxBool(false);
    Account? currentAccount;

    addAccounts.listen((addAccount) {
      if (addAccount) {
        controller.hideAlert();
      }
    });

    var pageTitle = Get.arguments != null
        ? Get.arguments["title"] ?? "Money Manager"
        : "Money Manager";

    DateTime initDate = DateTime.now();

    TextEditingController acctNameC = TextEditingController(text: "");
    TextEditingController currNameC = TextEditingController(text: "BDT");
    TextEditingController initBalanceC = TextEditingController(text: "0");
    TextEditingController initDateC = TextEditingController(
        text: DateFormat('MMM dd, yyyy').format(initDate));

    Widget addAccountsView() {
      return Container(
        padding: const EdgeInsets.only(
            left: 16, top: 32, right: 16),
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  obscureText: false,
                  controller: acctNameC,
                  style: const TextStyle(
                      color: AppColor.textColor),
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                    labelStyle: const TextStyle(
                        color: AppColor.colorPrimary),
                    errorText: controller.userPassError.value,
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.abc,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: false,
                  controller: currNameC,
                  style: const TextStyle(
                      color: AppColor.textColor),
                  decoration: InputDecoration(
                    hintText: "0",
                    labelText: 'Currency Name',
                    labelStyle: const TextStyle(
                        color: AppColor.colorPrimary,
                        fontWeight: FontWeight.bold),
                    errorText: controller.userPassError.value,
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.abc,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        obscureText: false,
                        controller: initBalanceC,
                        decoration: InputDecoration(
                          labelText: 'Initial Balance',
                          labelStyle: const TextStyle(
                              color: AppColor.colorPrimary),
                          errorText:
                          controller.userPassError.value,
                          border:
                          const UnderlineInputBorder(),
                          suffixIcon: const Icon(
                            Icons.currency_pound,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: DateTimePicker(
                        controller: initDateC,
                        initialDate: initDate,
                        firstDate:
                        DateTime(initDate.year - 1),
                        lastDate: DateTime(initDate.year + 5),
                        decoration: InputDecoration(
                          labelText: 'Initial Date',
                          enabled: false,
                          labelStyle: const TextStyle(
                              color: AppColor.colorPrimary),
                          errorText:
                          controller.userPassError.value,
                          disabledBorder:
                          const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: AppColor
                                      .colorPrimary)),
                          border:
                          const UnderlineInputBorder(),
                          suffixIcon: const Icon(
                            Icons.date_range,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const ColumnSpace(),
            Expanded(
                child: GridView.count(
                  physics: const ScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(2),
                  children: accountsIconList
                      .map((iconData) => GridIconItem(
                    icon: iconData,
                  ))
                      .toList(),
                )),
            const ColumnSpace()
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$pageTitle"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (addAccounts.isTrue) {
              currentAccount = null;
              addAccounts.value = false;
            } else {
              Get.back();
            }
          },
        ),
        actions: [
          Obx(() => Visibility(
              visible: addAccounts.isTrue && currentAccount != null,
              child: IconButton(
                onPressed: () {
                  if (currentAccount != null) {
                    currentAccount?.delete();
                    addAccounts.value = !addAccounts.value;
                    controller.success("${currentAccount?.name} deleted!");
                    currentAccount = null;
                  }
                },
                icon: const Icon(Icons.delete, color: AppColor.colorDanger),
              ))),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ThemeButton(
                text: addAccounts.isFalse ? "NEW" : "SAVE",
                onPressed: () async {
                  if (addAccounts.isTrue) {
                    if (acctNameC.text.isEmpty) {
                      controller.failure("Account Name is Blank!");
                      return;
                    }
                    if (currNameC.text.isEmpty) {
                      controller.failure("Currency name is Blank!");
                      return;
                    }
                    if (currentAccount == null) {
                      currentAccount = await Account(
                              name: acctNameC.text,
                              currencyName: currNameC.text,
                              initBalance: int.parse(initBalanceC.text))
                          .save();
                      controller.success("${acctNameC.text} Saved!");
                      currentAccount = null;
                    } else {
                      currentAccount = await currentAccount
                          ?.copyWith(
                              name: acctNameC.text,
                              currencyName: currNameC.text,
                              initBalance: int.parse(initBalanceC.text))
                          .update();
                      controller.success("${acctNameC.text} Updated!");
                      currentAccount = null;
                    }
                  }
                  addAccounts.value = !addAccounts.value;
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: BACKGROUND),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Obx(() => controller.alertWidget.value),
                Expanded(
                  child: Obx(
                    () {
                      if (currentAccount != null) {
                        acctNameC.text = currentAccount?.name ?? "N/A";
                        currNameC.text = currentAccount?.currencyName ?? "N/A";
                        initBalanceC.text =
                            currentAccount?.initBalance.toString() ?? "0";
                        initDateC.text =
                            DateFormat('MMM dd, yyyy').format(initDate);
                      } else {
                        acctNameC = TextEditingController(text: "");
                        currNameC = TextEditingController(text: "BDT");
                        initBalanceC = TextEditingController(text: "0");
                      }
                      return Visibility(
                        visible: addAccounts.isFalse,
                        replacement: addAccountsView(),
                        child: FutureBuilder(
                          initialData: const <Account>[],
                          future: Account.all(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Account>> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null &&
                                  snapshot.data!.isNotEmpty) {
                                List<Account> accounts = snapshot.data ?? [];
                                return ListView(
                                  shrinkWrap: true,
                                  children: accounts
                                      .map((account) => AccountItem(
                                            icon: Icons.currency_bitcoin,
                                            accountName: account.name ?? "",
                                            currencyName: account.currencyName,
                                            balance: account.initBalance
                                                .toStringAsFixed(2),
                                            onTap: () {
                                              currentAccount = account;
                                              addAccounts.value =
                                                  !addAccounts.value;
                                            },
                                          ))
                                      .toList(),
                                );
                              }
                            }
                            return ListView(
                              shrinkWrap: true,
                              children: const [
                                AccountItem(
                                  icon: Icons.currency_bitcoin,
                                  accountName: "-----",
                                  currencyName: "BDT",
                                  balance: "0.00",
                                ),
                                AccountItem(
                                  icon: Icons.currency_franc,
                                  accountName: "-----",
                                  currencyName: "BDT",
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
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


