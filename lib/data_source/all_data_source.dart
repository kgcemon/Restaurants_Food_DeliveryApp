import 'package:food_yum/models/model_home.dart';

class all_data_source {

  static allpic(next) {
    return "assets/" + next;
  }


  List catalist = [
    {"img": allpic('food1.png'), "name": "Healthy"},
    {"img": allpic("cake 1.png"), "name": "Sweets"},
    {"img": allpic("burger 1.png"), "name": "Burger"},
    {"img": allpic("sushi.png"), "name": "Sushi"},
  ];



   loaddata(){
    List<catagry_model> newlist = [];
    catalist.forEach((element) {
     newlist.add(catagry_model.fromjson(element));
    });
    return newlist;
  }




  static List allfooditems = [
    {"img": allpic("mainfood.png"), "name": "Martabak Ujang", "price": "Rp 12.500.000"},
    {"img": allpic('food2.png'), "name": "Es Tongtong", "price": "Rp 590.000"},
    {"img": allpic("food3.png"), "name": "Donat Cherry", "price": "Rp 780.000"},
    {"img": allpic("food4.png"), "name": "Telur Jahe", "price": "Rp 2350.000" },
    {"img": allpic("food5.png"), "name": "Silver Choco", "price": "Rp 450.000"},
    {"img": allpic("food6.png"), "name": "Candy Pizza", "price": "Rp 890.000"},
  ];
}
