import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocalizacaoUser extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String endereco = '';
  String erro = '';

  LocalizacaoUser() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;

      // Obtendo o endereço a partir da latitude e longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

      if (placemarks.isNotEmpty) {
        if (placemarks[0].subThoroughfare != null) {
          endereco += placemarks[0].subThoroughfare! + ', ';
        }
        if (placemarks[0].thoroughfare != null) {
          endereco += placemarks[0].thoroughfare! + ', ';
        }
        if (placemarks[0].subLocality != null) {
          endereco += placemarks[0].subLocality! + ', ';
        }
        if (placemarks[0].locality != null) {
          endereco += placemarks[0].locality! + ', ';
        }
        if (placemarks[0].administrativeArea != null) {
          endereco += placemarks[0].administrativeArea! + ', ';
        }
        if (placemarks[0].country != null) {
          endereco += placemarks[0].country!;
        }

        print('Endereço: $endereco'); // Adicione esta linha para depuração
      } else {
        endereco = 'Endereço não disponível';
        print('Endereço não disponível');
      }

    } catch (e) {
      erro = e.toString();
      print('Erro ao obter localização: $erro'); // Adicione esta linha para depuração
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      throw ('Por favor, habilite a localização no SmartPhone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        throw ('Você precisa habilitar a localização no SmartPhone');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      throw ('Você precisa habilitar a localização no SmartPhone');
    }

    return await Geolocator.getCurrentPosition();
  }
}
