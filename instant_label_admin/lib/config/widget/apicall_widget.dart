import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APICallWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget loader;
  final Widget Function(T data) onSuccess;
  const APICallWidget({
    super.key,
    required this.future,
    this.loader = const APILoaderWidget(),
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onSuccess(snapshot.data!);
        } else if (snapshot.hasError) {
          return const Text('Not Found!');
        } else {
          return loader;
        }
      },
    );
  }
}

class APILoaderWidget extends StatelessWidget {
  const APILoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class APIHttp {
  final String url;

  APIHttp(
    this.url,
  );

  Future<dynamic> getRequest() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postRequest(Map<String, String> body) async {
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception();
    }
  }
}
