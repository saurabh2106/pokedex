import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final Dio dio = Dio();
  DioClient();

  Future<Response> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to fetch data: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }
}

final dioProvider = Provider<DioClient>((ref) => DioClient());
