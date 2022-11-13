import 'package:db/database/db.dart';
import 'package:db/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtmobile = TextEditingController();
  HomeController homeController = Get.put(HomeController());

  DbHelper db = DbHelper();

  void getData() async {
    homeController.detailsList.value = await db.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
          title: Text("Add Customer",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white,fontSize: 18),
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
                controller: txtmobile,
                style: TextStyle(color: Colors.white,fontSize: 18),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Mobile No.",
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.call,color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixText: "+91 ",
                  prefixStyle: TextStyle(color: Colors.grey,fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade900,width: 3),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  db.insertData(txtname.text, txtmobile.text);
                  getData();
                  Get.back();
                },
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
