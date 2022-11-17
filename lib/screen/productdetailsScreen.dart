import 'package:db/controller/homeController.dart';
import 'package:db/database/db.dart';
import 'package:db/screen/clientScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();

  HomeController homeController = Get.put(HomeController());

  DbHelper db = DbHelper();

  void getData() async {
    homeController.productList.value = await db.productreadData(id:homeController.datapicker!.id!);
    homeController.addition();
    homeController.homeaddition();
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
          title: Text("Entry Details",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w300),),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue.shade900,
                alignment: Alignment.center,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${homeController.datapicker!.name}",style: TextStyle(fontSize: 21),),
                                  Text("${homeController.productdatapicker!.date} - ${homeController.productdatapicker!.time}")
                                ],
                              ),
                              Text("₹ ${homeController.productdatapicker!.amount}",style: TextStyle(fontSize: 25),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 2),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Running Balance",style: TextStyle(fontSize: 17),),
                              Text("₹ ${homeController.productdatapicker!.amount}",style: TextStyle(fontSize: 25),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Details",style: TextStyle(fontSize: 17),),
                              Text("₹ ${homeController.productdatapicker!.name}",style: TextStyle(fontSize: 25),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: MediaQuery.of(context).size.height/1.87,),
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.grey.shade900,
                child: ElevatedButton(
                  onPressed: (){
                    txtname.text = homeController.productdatapicker!.name!;
                    txtamount.text = homeController.productdatapicker!.amount!;
                    txtdate.text = homeController.productdatapicker!.date!;
                    txttime.text = homeController.productdatapicker!.time!;

                    Get.defaultDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              textInputAction: TextInputAction.next,
                              controller: txtname,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.person,color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue.shade900,width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: txtamount,
                              decoration: InputDecoration(
                                labelText: "Amount",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.currency_rupee,color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue.shade900,width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: txtdate,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Date",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: IconButton(onPressed: (){
                                  datepickerDialogue();
                                },icon: Icon(Icons.calendar_month,color: Colors.grey),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue.shade900,width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: txttime,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Time",
                                labelStyle: TextStyle(color: Colors.grey),
                                prefixIcon: InkWell(
                                    onTap: (){
                                      Timepickerdialogue();
                                    },
                                    child: Icon(Icons.calendar_month,color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue.shade900,width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    db.productupdateData(homeController.productdatapicker!.id!, txtname.text, txtamount.text, txtdate.text, txttime.text);
                                    getData();
                                    Get.back();
                                    Get.back();
                                  },
                                  child: Text("UPDATE"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade900),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    db.productdeleteData(homeController.productdatapicker!.id!);
                                    getData();
                                    Get.back();
                                    Get.back();
                                  },
                                  child: Text("DELETE"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text("UPDATE | DELETE",style: TextStyle(fontSize: 22),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  void datepickerDialogue() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(3000));
    homeController.getData(date);
    if (date != null) {
      txtdate.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }
  void Timepickerdialogue() async {
    TimeOfDay? t1 =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (t1 != null) {
      DateTime parsedtime =
      DateFormat.jm().parse(t1.format(context).toString());

      String formetdtime = DateFormat('hh:mm').format(parsedtime);

      txttime.text = formetdtime;
    }
  }

}

/*
*
* */
