import 'package:db/model/Model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList<Map> detailsList = <Map>[].obs;
  Model? datapicker;


  RxList<Map> productList = <Map>[].obs;


  var date = DateTime.now();

  void getData(dynamic date1)
  {
    date = date1;
  }
}