import 'package:db/database/db.dart';
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

  void addition() {

    int index = 0;
    totalsum.value=0;
    pendingsum.value=0;

    print(datapicker!.id);

    for(index=0;index<productList.length;index++) {
      if (productList[index]["payment_status"] == 0) {
        totalsum.value = totalsum.value + int.parse(productList[index]["amount"]);
      }
      else {
        pendingsum.value = pendingsum.value + int.parse(productList[index]["amount"]);
      }
    }
  }

  // ===================================================

  void homeaddition() async{
    DbHelper db = DbHelper();
    productList.value = await db.productreadData();


    int index = 0;
    greensum.value=0;
    redsum.value=0;

    for(index=0;index<productList.length;index++) {
      if (productList[index]["payment_status"] == 0) {
        greensum.value = greensum.value +
            int.parse(productList[index]["amount"]);
      }
      else {
        redsum.value = redsum.value +
            int.parse(productList[index]["amount"]);
      }
    }
  }
}