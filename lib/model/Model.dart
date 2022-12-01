class Model
{
  String? id,name,mobile;

  Model({this.id,this.name, this.mobile});
}

class productModel
{
  String? name,amount,date,time;
  String? id;
  int? payment_status;

  productModel({this.id, this.name, this.amount, this.date, this.time,this.payment_status});
}