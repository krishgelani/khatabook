import 'package:db/model/Model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList<Map> detailsList = <Map>[].obs;
  Model? datapicker;
}