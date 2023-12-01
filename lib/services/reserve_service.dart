import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiReserve {
  /// Encapsula la URL, los encabezados y la funcionalidad de registro para realizar solicitudes HTTP a la API de reservas.

  static const String url = "https://api.sebastian.cl";
  static const String var1 = "application/json";
  static final Logger _logger = Logger();

  static Future<List<dynamic>> reserveSearch(
      /// Realiza una búsqueda de reservas disponibles basadas en los parámetros proporcionados.

      String jwt,
      Map<String, dynamic> requestBody) async {
    Uri url_ = Uri.parse('$url/booking/v1/reserve/search');
    Map<String, String> headers = {
      'accept': var1,
      'Content-Type': var1,
      'Authorization': "Bearer $jwt",
    };

    try {
      final response = await http.post(url_,
          headers: headers, body: json.encode(requestBody));
      _logger.d(json.decode(response.body));
      return json.decode(response.body);
    } catch (error) {
      _logger.e('Error al realizar la busqueda de reserva: $error');
      return [];
    }
  }

  static Future<List<dynamic>> reserveRequest(
      /// Solicita una reserva para una sala y un horario específicos.

      String jwt,
      Map<String, dynamic> requestBody) async {
    Uri url_ = Uri.parse('$url/booking/v1/reserve/request');
    Map<String, String> headers = {
      'accept': var1,
      'Content-Type': var1,
      'Authorization': "Bearer $jwt",
    };

    try {
      final response = await http.post(url_,
          headers: headers, body: json.encode(requestBody));
      _logger.d(json.decode(response.body));
      return json.decode(response.body);
    } catch (error) {
      _logger.e('Error al obtener salas: $error');
      return [];
    }
  }

  static Future<List<dynamic>> infoReserve(
      /// Obtiene información sobre una reserva específica.

      String jwt,
      String roomCode,
      String isoDate) async {
    Uri url_ = Uri.parse('$url/booking/v1/reserve/$roomCode/schedule/$isoDate');
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

  static Future<void> reserveCancel(String jwt, String token) async {
    /// Cancela una reserva por su token.
    
    Uri url_ = Uri.parse('$url/booking/v1/reserve/$token/cancel');
    Map<String, String> headers = {
      'accept': var1,
      'Content-Type': var1,
      'Authorization': "Bearer $jwt",
    };

    try {
      final response = await http.delete(url_, headers: headers);
      if (response.statusCode == 200) {
        _logger.i('Reserva cancelada exitosamente');
      } else {
        _logger.e(
            'Error al cancelar la reserva. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      _logger.e('Error al cancelar la reserva: $error');
    }
  }
}
