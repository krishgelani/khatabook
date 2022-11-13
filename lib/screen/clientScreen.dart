import 'package:db/controller/homeController.dart';
import 'package:db/database/db.dart';
import 'package:db/screen/yougaveScreen.dart';
import 'package:db/screen/yougotScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  HomeController homeController = Get.put(HomeController());

  DbHelper db = DbHelper();

  void getData() async {
    homeController.detailsList.value = await db.readData();
  }
  void productgetdata() async {
    homeController.productList.value =
    await db.productreadData(homeController.datapicker!.id!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    productgetdata();
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
              onPressed: () {},
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
                            Text(
                              "₹ 6000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
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
                            Text(
                              "₹ 6000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
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
                      onPressed: () {},
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
                    SizedBox(width: 65,),
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
                  itemCount: homeController.productList.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        // color: homeController.productList[index]['payment_status'] == 0 ? Colors.green : Colors.red,
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
                                    child: Text(
                                      "${homeController.productList[index]['date']}",
                                      style: TextStyle(color: Colors.white),
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
                                    width:70,
                                    alignment: Alignment.center,
                                    color: Colors.red,
                                    child: homeController.productList[index]['payment_status'] == 1 ? Text("${homeController.productList[index]['amount']}", style: TextStyle(color: Colors.white),) : Text(""),
                                  ),
                                  Container(
                                    width:70,
                                    alignment: Alignment.center,
                                    color: Colors.green,
                                    child: homeController.productList[index]['payment_status'] == 0 ? Text("${homeController.productList[index]['amount']}", style: TextStyle(color: Colors.white),) : Text(""),
                                  ),
                                ],
                              )
                            ],
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
}
