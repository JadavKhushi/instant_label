import 'package:flutter/material.dart';
import 'package:instant_label/config/widget/apicall_widget.dart';

class APICallDialog<T> {
  final BuildContext context;
  final Future<T> future;
  final Widget loader;
  final Function(T? data) onSuccess;

  const APICallDialog(
    this.context, {
    required this.future,
    this.loader = const APILoaderWidget(),
    required this.onSuccess,
  });

  create() {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: APICallWidget(
            future: future,
            onSuccess: (data) {
              Future.delayed(
                const Duration(milliseconds: 300),
                () {
                  Navigator.pop(context);
                  onSuccess(data);
                },
              );
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
