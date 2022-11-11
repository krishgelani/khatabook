import 'package:db/model/Model.dart';
import 'package:db/model/productModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList<Map> detailsList = <Map>[].obs;
  Model? datapicker;


  RxList<Map> productList = <Map>[].obs;
}