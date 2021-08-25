import 'dart:convert';

import 'package:http/http.dart' as http;

class SuratModel{
  String nomor,nama, asma, arti, ayat, teks;

  SuratModel({
    this.nomor,
    this.nama,
    this.asma,
    this.arti,
    this.ayat,
    this.teks
  });

  factory SuratModel.fromJson(Map<String, dynamic> json)=>SuratModel(
    nomor: json['nomor'],
    nama: json['nama'],
    asma: json['asma'],
    arti: json['arti'],
    ayat: json['ayat'],
    teks: json['teks'].toString()
  );

  static Future<List<SuratModel>> getSuratFromAPI() async{
    String apiURL = 'https://api.banghasan.com/quran/format/json/surat';
    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(apiResult.body);
    List<dynamic> listSurat = jsonObject['hasil'];

    List<SuratModel> list = [];
    for (var i = 0; i < listSurat.length; i++) {
      list.add(SuratModel.fromJson(listSurat[i]));
    }
    print(list.length);
    return list;
  } 
}
// class Surat {
//   String nomor, nama, asma, arti;

//   Surat({
//     this.nomor, this.nama, this.asma, this.arti
//   });

//   factory Surat.createSurat(Map<String,dynamic> object){
//     return Surat(
//       nomor: object['nomor'],
//       nama: object['nama'],
//       asma: object['asma'],
//       arti: object['arti']
//     );
//   }

//   getSuratFromAPI() async{
//     String apiURL = 'https://api.banghasan.com/quran/format/json/surat';
//     var apiResult = await http.get(Uri.parse(apiURL));
//     var jsonObject = json.decode(apiResult.body);
//     var dataSurat = (jsonObject as Map<String, dynamic>)['hasil'];

//     List<Surat> listSurat = [];

//     for (var i = 0; i < dataSurat.length; i++) {
//       listSurat.add(Surat.createSurat(dataSurat[i]));
//       return listSurat;
//     }

//   } 

  
