class catagry_model {
  dynamic img;
  String cataname;

  catagry_model({required this.cataname, required this.img});

  factory catagry_model.fromjson(Map<dynamic, dynamic> json ) =>
      catagry_model(cataname: json['name']??"", img: json['img']??"");
}