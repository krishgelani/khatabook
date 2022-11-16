import 'package:db/controller/homeController.dart';
import 'package:db/database/db.dart';
import 'package:db/model/Model.dart';
import 'package:db/screen/productdetailsScreen.dart';
import 'package:db/screen/yougaveScreen.dart';
import 'package:db/screen/yougotScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  HomeController homeController = Get.put(HomeController());

  DbHelper db = DbHelper();

  void getData() async {
    homeController.productList.value = await db.productreadData(id: homeController.datapicker!.id!);
    homeController.addition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
          title: Text("${homeController.datapicker!.name}"),
          actions: [
            IconButton(
              onPressed: () {
                String number = "tel: ${homeController.datapicker!.mobile}";
                launchUrl(Uri.parse(number));
              },
              icon: Icon(Icons.call),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              color: Colors.blue.shade900,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Income",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                            ),
                            Obx(
                              () => Text(
                                "₹ ${homeController.totalsum.value}",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Expense",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                            ),
                            Obx(
                              () => Text(
                                "₹ ${homeController.pendingsum.value}",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.currency_rupee_sharp,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        // String number = "sms: ${homeController.datapicker!.mobile}";
                        // launchUrl(Uri.parse(number));
                        Share.share("your payment day is here plea");
                      },
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Date/Time",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Remark",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "You Gave | You Got",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: homeController.productList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        homeController.productdatapicker = productModel(
                          id: homeController.productList[index]['id'].toString(),
                          name: homeController.productList[index]['name'],
                          amount: homeController.productList[index]['amount'],
                          date: homeController.productList[index]['date'],
                          time: homeController.productList[index]['time'],
                        );
                        Get.to(ProductScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          color: Colors.grey.shade900,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 110,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${homeController.productList[index]['date']}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "${homeController.productList[index]['time']}",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${homeController.productList[index]['name']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      alignment: Alignment.center,
                                      color: Colors.red,
                                      child: homeController.productList[index]
                                                  ['payment_status'] ==
                                              1
                                          ? Text(
                                              "${homeController.productList[index]['amount']}",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )
                                          : Text(""),
                                    ),
                                    Container(
                                      width: 70,
                                      alignment: Alignment.center,
                                      color: Colors.green,
                                      child: homeController.productList[index]
                                                  ['payment_status'] ==
                                              0
                                          ? Text(
                                              "${homeController.productList[index]['amount']}",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )
                                          : Text(""),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(YougaveScreen());
                      },
                      child: Text("YOU GAVE ₹"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(YougotScreen());
                      },
                      child: Text("YOU GOT ₹"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addition() {
    int index = 0;
    homeController.totalsum.value = 0;
    homeController.pendingsum.value = 0;

    print(homeController.datapicker!.id);

    for (index = 0; index < homeController.productList.length; index++) {
      if (homeController.productList[index]["payment_status"] == 0) {
        homeController.totalsum.value = homeController.totalsum.value +
            int.parse(homeController.productList[index]["amount"]);
      } else {
        homeController.pendingsum.value = homeController.pendingsum.value +
            int.parse(homeController.productList[index]["amount"]);
      }
    }
  }
}
