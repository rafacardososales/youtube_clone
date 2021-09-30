import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:youtube_clone/model/Video.dart';



const CHAVE_YOUTUBE_API = "AIzaSyDZNLlObt5lRYcnT6sGOCerzrSZFPDdVkY";
const ID_CANAL = "UCNd0qqcBpuXCWPM76lDUxqg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";




class Api {
//Future<List<Video>> = pesquisar

  Future<List<Video>?> pesquisar (String  pesquisa) async {
    http.Response response = await http.get(
          Uri.parse(URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa")
    );
    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = jsonDecode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;


      /*
      for (var video in dadosJson["items"]){
        print("Resultado: "+ video.toString());
      }
      */

      //print ("resultado: " + dadosJson["items"].toString());

    } else { Text("Error");}
  }
}