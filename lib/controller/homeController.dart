import 'package:db/model/Model.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController
{
  RxList<Map> detailsList = <Map>[].obs;
  Model? datapicker;
  RxInt totalsum = 0.obs;
  RxInt pendingsum = 0.obs;

  RxInt greensum = 0.obs;
  RxInt redsum = 0.obs;

  RxList<Map> productList = <Map>[].obs;


  var date = DateTime.now();

  void getData(dynamic date1)
  {
    date = date1;
  }

  // void total() {
  //   int index = 0;
  //   for(index=0;index<productList.length;index++)
  //     {
  //       if(productList[index]['payment_status']==0)
  //         {
  //           i = i+ int.parse(productList[index]['amount']);
  //         }
  //     }
  // }
}