import 'package:db/database/db.dart';
import 'package:db/model/Model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList detailsList = [].obs;
  RxList searchdetailsList = [].obs;


  Model? datapicker;
  RxInt totalsum = 0.obs;
  RxInt pendingsum = 0.obs;

  RxInt greensum = 0.obs;
  RxInt redsum = 0.obs;

  RxList<Map> productList = <Map>[].obs;
  RxList<Map> productList1 = <Map>[].obs;

  RxString filterdate = "".obs;

  RxInt radioselect = 0.obs;

  productModel? productdatapicker;


  var date = DateTime.now();

  void getData(dynamic date1)
  {
    date = date1;
  }

  void addition() {

    int index = 0;
    totalsum.value=0;
    pendingsum.value=0;

    print(datapicker?.id);

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
    productList1.value = await db.productreadData();


    int index = 0;
    greensum.value=0;
    redsum.value=0;

    for(index=0;index<productList1.length;index++) {
      if (productList1[index]["payment_status"] == 0) {
        greensum.value = greensum.value +
            int.parse(productList1[index]["amount"]);
      }
      else {
        redsum.value = redsum.value +
            int.parse(productList1[index]["amount"]);
      }
    }
  }

  void searchdata(String query) async {
    searchdetailsList = detailsList;
    if(query.isNotEmpty)
      {
        List searchList = [];
        for(var search in searchdetailsList)
          {
            if(search['name'].toLowerCase().contains(query.toLowerCase()))
              {
                searchList.add(search);
              }
          }
        detailsList.value = searchList;
      }
    else
      {
        DbHelper db = DbHelper();

        detailsList.value = await db.readData();
      }
  }


}