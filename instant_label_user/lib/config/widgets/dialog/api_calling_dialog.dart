import 'package:flutter/material.dart';
import 'package:instant_label_user/config/constants/constant_colours.dart';
import 'package:instant_label_user/config/widgets/apicall_widget.dart';

class APICallingDialog<T> {
  final BuildContext context;
  final Future<T> future;
  final Widget loader;
  final Function(T? data) onSuccess;

  const APICallingDialog(
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
          color: PRIMARY_ON_COLOR,
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
