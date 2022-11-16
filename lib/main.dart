import 'package:db/screen/clientScreen.dart';
import 'package:db/screen/customerDetails.dart';
import 'package:db/screen/filterdateScreen.dart';
import 'package:db/screen/historyScreen.dart';
import 'package:db/screen/homeScreen.dart';
import 'package:db/screen/productdetailsScreen.dart';
import 'package:db/screen/yougaveScreen.dart';
import 'package:db/screen/yougotScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => HomeScreen(),
        '/customerdetails':(p0) => CustomerDetails(),
        '/client':(p0) => ClientScreen(),
        '/yougave':(p0) => YougaveScreen(),
        '/yougot':(p0) => YougotScreen(),
        '/productdetail':(p0) => ProductScreen(),
        '/history':(p0) => HistoryScreen(),
        '/filter':(p0) => FilterdateScreen(),
      },
    )
  );
}
