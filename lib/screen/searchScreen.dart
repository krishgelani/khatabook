import 'package:db/controller/homeController.dart';
import 'package:db/model/Model.dart';
import 'package:db/screen/clientScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: TextField(
            autofocus: true,
            cursorColor: Colors.white,
            onChanged: (value) {
              homeController.searchdata(value);
            },
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              hintText: "Name",
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white,width: 2),
              ),
            ),
          ),
        ),
        body: Obx(
          ()=> ListView.builder(
            itemCount: homeController.detailsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  homeController.datapicker = Model(
                    name: homeController.detailsList[index]['name'],
                    id: homeController.detailsList[index]['id'].toString(),
                    mobile: homeController.detailsList[index]['mobile'],
                  );
                  Get.to(ClientScreen());
                },
                child: ListTile(
                  title: Text("${homeController.detailsList[index]['name']}",style: TextStyle(color: Colors.white),),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
