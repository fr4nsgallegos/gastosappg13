class GastoModel {
  String tittle;
  double price;
  String datetime;
  String type;

  GastoModel({
    required this.tittle,
    required this.price,
    required this.datetime,
    required this.type,
  });

  factory GastoModel.fromDB(Map<String, dynamic> data) => GastoModel(
    tittle: data["tittle"],
    price: data["price"],
    datetime: data["datetime"],
    type: data["type"],
  );

  Map<String, dynamic> convertirAMap() => {
    "title": tittle,
    "price": price,
    "datetime": datetime,
    "type": type,
  };
}
