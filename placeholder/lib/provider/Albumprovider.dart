import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:placeholder/model/Albummodel.dart';
import 'package:placeholder/model/errormessage.dart';
import 'package:http/http.dart'as http;

class AlbumProvider with ChangeNotifier {
  Album? albumdata;

  Future<Album> factalbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );
    if (response.statusCode == 200) {
      print("fv");
      Album x = Album.fromJson(jsonDecode(response.body)); //
      albumdata = x;
      notifyListeners();
      return x;
    } else {
      print("fdvd");
      throw Exception('Failed to load album');
    }
  }

  Future<Detail> createAlbum(Detail det, String id) async {
    var x = json.encode(det.toJson());
    try{
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: x,
    );
      var newValue = Detail.fromJson(jsonDecode(response.body));
      albumdata!.Details!.add(newValue);
      notifyListeners();
      return newValue;
    }catch (c){
      throw OwnHttpException(message: "Failed to create album.");
    }
  }

  Future<Detail> updateAlbum(Detail album, int id) async {

    var x = json.encode(album.toJson());
    final photodataIndex = albumdata!.Details!.indexWhere((element) => element.id == id);
try {
  final responses = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/${id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: x,
  );
      var updatevalue = Detail.fromJson(jsonDecode(responses.body));
       albumdata!.Details![photodataIndex]=album!;

      notifyListeners();

      return updatevalue;

    }catch(error){
  throw OwnHttpException( message: "Failed to Edit album.");
}
  }


  Future<void> deleteUser(int id) async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/$id');
      final albumdataIndex =
      albumdata!.Details!.indexWhere((element) => element.id == id);
      final response = await http.delete(url);
      albumdata!.Details!.removeAt(albumdataIndex);
      notifyListeners();
    }catch (e){
      throw OwnHttpException(message: "Failed to delete album.");
    }
  }
}