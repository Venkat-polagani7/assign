import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class DataProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _images = [];
//   int _page = 1;
//   final int _perPage = 20;
//   bool _isLoading = false;
//
//   List<Map<String, dynamic>> get images => _images;
//
//   bool get isLoading => _isLoading;
//
//   Future<void> fetchImages() async {
//     if (_isLoading) return;
//     _isLoading = true;
//
//     final String apiUrl =
//         'https://api.shutterstock.com/v2/images/search?page=$_page&per_page=$_perPage';
//     final String apiKey = 'https://api.shutterstock.com/v2/images/search';
//
//     try {
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Basic TmRBTW5BazdpZ3hxOEkxZHZXeTVQc3hjSmsyWUFpV0c6VkhsdUxKSWM2S2RiRUxxMA==',
//         },
//       );
//
//       if (response.statusCode != 200) {
//         throw Exception('Failed to load images');
//       }
//
//       final responseData = json.decode(response.body);
//       final List<dynamic>? dataList = responseData['data'];
//
//       if (dataList == null) {
//         throw Exception('No data found in response');
//       }
//
//       List<Map<String, dynamic>> newImages = [];
//
//       for (var data in dataList) {
//         newImages.add({
//           'id': data['id'],
//           'url': data['assets']['huge_thumb']['url'], // Change URL based on onTap requirement
//         });
//       }
//
//       _images.addAll(newImages); // Update _images list correctly
//       _isLoading = false;
//       _page++;
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching images: $error');
//       _isLoading = false;
//       throw (error);
//     }
//   }
//
// }
class DataProvider with ChangeNotifier {
  List<Map<String, dynamic>> _images = [];
  int _page = 1;
  final int _perPage = 20;
  bool _isLoading = false;
  String _selectedImageType = 'preview'; // Default image type

  List<Map<String, dynamic>> get images => _images;

  bool get isLoading => _isLoading;

  Future<void> fetchImages() async {
    if (_isLoading) return;
    _isLoading = true;

    final String apiUrl =
        'https://api.shutterstock.com/v2/images/search?page=$_page&per_page=$_perPage';
    final String apiKey = 'https://api.shutterstock.com/v2/images/search';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Basic TmRBTW5BazdpZ3hxOEkxZHZXeTVQc3hjSmsyWUFpV0c6VkhsdUxKSWM2S2RiRUxxMA==',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load images');
      }

      final responseData = json.decode(response.body);
      final List<dynamic>? dataList = responseData['data'];

      if (dataList == null) {
        throw Exception('No data found in response');
      }

      List<Map<String, dynamic>> newImages = [];

      for (var data in dataList) {
        newImages.add({
          'id': data['id'],
          'url': data['assets'][_selectedImageType]['url'], // Use selected image type
        });
      }

      _images.addAll(newImages);
      _isLoading = false;
      _page++;
      notifyListeners();
    } catch (error) {
      print('Error fetching images: $error');
      _isLoading = false;
      throw (error);
    }
  }

  void setImageType(String imageType) {
    _selectedImageType = imageType;
    _images.clear(); // Clear existing images when image type changes
    _page = 1; // Reset page to fetch new images
    fetchImages(); // Fetch new images based on the selected type
  }
}
