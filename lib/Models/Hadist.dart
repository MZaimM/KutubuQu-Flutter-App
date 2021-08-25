class HadistModel {
  String name, id, arab;
  int number;

  HadistModel({this.name, this.id, this.arab, this.number});

  factory HadistModel.fromJson(Map<String, dynamic> json) => HadistModel(
      name: json['name'],
      id: json['id'],
      arab: json['arab'],
      number: json['number']);
}
