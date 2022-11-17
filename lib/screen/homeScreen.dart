import 'package:db/model/Model.dart';
import 'package:db/screen/clientScreen.dart';
import 'package:db/screen/customerDetails.dart';
import 'package:db/database/db.dart';
import 'package:db/controller/homeController.dart';
import 'package:db/screen/filterdateScreen.dart';
import 'package:db/screen/historyScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController utxtname = TextEditingController();
  TextEditingController utxtstd = TextEditingController();
  TextEditingController utxtmobile = TextEditingController();

  HomeController homeController = Get.put(HomeController());

  DbHelper db = DbHelper();

  void getData() async {
    homeController.detailsList.value = await db.readData();
    homeController.productList.value = await db.productreadData();
    homeController.homeaddition();
    homeController.addition();
  }

  @override
  void initState() {
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
          title: Text("KHATABOOK",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Get.to(FilterdateScreen());
              },
              icon: Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text("You will Give"),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => Text(
                                  "₹ ${homeController.greensum.value}",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("You will Get"),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => Text(
                                  "₹ ${homeController.redsum.value}",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(HistoryScreen());
                      },
                      child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          "VIEW HISTORY >",
                          style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: homeController.detailsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        homeController.datapicker = Model(
                          name: homeController.detailsList[index]['name'],
                          id: homeController.detailsList[index]['id']
                              .toString(),
                          mobile: homeController.detailsList[index]['mobile'],
                        );
                        Get.to(ClientScreen());
                      },
                      child: ListTile(
                        leading: Text(
                          "${homeController.detailsList[index]['id']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "${homeController.detailsList[index]['name']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${homeController.detailsList[index]['mobile']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: InkWell(
                                  child: Text("update"),
                                  onTap: () {
                                    utxtname = TextEditingController(
                                        text:
                                            "${homeController.detailsList[index]['name']}");
                                    utxtmobile = TextEditingController(
                                        text:
                                            "${homeController.detailsList[index]['mobile']}");
                                    utxtstd = TextEditingController(
                                        text:
                                            "${homeController.detailsList[index]['std']}");

                                    Get.defaultDialog(
                                      title: "Details",
                                      titleStyle:
                                          TextStyle(color: Colors.black),
                                      backgroundColor: Colors.white,
                                      content: Column(
                                        children: [
                                          TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller: utxtname,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              hintText: "Name",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.blue.shade900),
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: utxtmobile,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              hintText: "Mobile No.",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.blue.shade900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              db.updateData(
                                                "${homeController.detailsList[index]['id']}",
                                                utxtname.text,
                                                utxtmobile.text,
                                              );
                                              getData();
                                              Get.back();
                                            },
                                            child: Text("Update"),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blue.shade900),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () {
                                  db.deleteData(
                                      "${homeController.detailsList[index]['id']}");
                                  db.productdeleteData(
                                      "${homeController.detailsList[index]['id']}");
                                  getData();
                                },
                              ),
                            ];
                          },
                          icon: Icon(Icons.more_vert, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(CustomerDetails());
          },
          backgroundColor: Colors.blue.shade900,
          icon: Icon(Icons.add, size: 37),
          label: Text(
            "ADD CUSTOMER",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
