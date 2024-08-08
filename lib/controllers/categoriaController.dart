import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Categoria {
  final String _id;
  final String nombre;

  const Categoria({
    required String id,
    required this.nombre,
  }) : _id = id;

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['_id'],
      nombre: json['nombre'],
    );
  }

  // Método para obtener el id
  String get id => _id;

  // Método para limpiar los objetos
  Categoria.empty()
      : _id = '',
        nombre = '';
}

// Función para obtener todas las categorías
Future<List<Categoria>> obtenerCategorias() async {
  try {
    final response = await http.get(
        Uri.parse('https://repositorio-backend-proyecto-api.onrender.com/api/categoria'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      final categorias = body.map((categoria) => Categoria.fromJson(categoria)).toList();
      return categorias;
    } else {
      throw Exception('Error al cargar categorías: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al obtener categorías: $e');
  }
}

// Función para crear una nueva categoría
Future<Categoria> crearCategoria(String nombre) async {
  try {
    final response = await http.post(
        Uri.parse('https://repositorio-backend-proyecto-api.onrender.com/api/categoria'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'nombre': nombre,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Categoria.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('No ha sido posible crear la categoría: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al crear la categoría: $e');
  }
}

// Función para actualizar una categoría existente
Future<Categoria> actualizarCategoria(String id, String nombre) async {
  try {
    final response = await http.put(
        Uri.parse('https://repositorio-backend-proyecto-api.onrender.com/api/categoria/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'nombre': nombre,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Categoria.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('No ha sido posible actualizar la categoría: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al actualizar la categoría: $e');
  }
}

// Función para eliminar una categoría
Future<Categoria> eliminarCategoria(String id) async {
  final response = await http.delete(
    Uri.parse('https://repositorio-backend-proyecto-api.onrender.com/api/categoria/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Categoria.empty();
  } else {
    throw Exception('Error al eliminar la categoría.');
  }
}
