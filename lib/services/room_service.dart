import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiSalas {
  /// Encapsula la URL, los encabezados y la funcionalidad de registro para realizar solicitudes HTTP a la API de salas.

  static const String url = "https://api.sebastian.cl";
  static const String var1 = "application/json";
  static final Logger _logger = Logger();

  static Future<List<dynamic>> getRooms(String jwt) async {
    /// Recupera una lista de todas las salas disponibles.

    Uri url_ = Uri.parse('$url/booking/v1/rooms/');
    Map<String, String> headers = {
      'accept': var1,
      'Content-Type': var1,
      'Authorization': "Bearer $jwt",
    };

    try {
      final response = await http.get(url_, headers: headers);
      _logger.d(json.decode(response.body));
      return json.decode(response.body);
    } catch (error) {
      _logger.e('Error al obtener salas: $error');
      return [];
    }
  }

  static Future<List<dynamic>> getRoomId(String jwt, String roomCode) async {
      /// Recupera la información de una sala específica por su código.

    Uri url_ = Uri.parse('$url/booking/v1/rooms/$roomCode');
    Map<String, String> headers = {
      'accept': var1,
      'Content-Type': var1,
      'Authorization': "Bearer $jwt",
    };

    try {
      final response = await http.get(url_, headers: headers);
      if (response.statusCode == 200) {
        _logger.d(json.decode(response.body));
        return json.decode(response.body);
      } else {
        _logger.e(
            'Error al cancelar la reserva. Código de estado: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      _logger.e('Error al obtener salas: $error');
      return [];
    }
  }
}
