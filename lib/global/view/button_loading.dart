import 'package:final_config_enviroment/model/enum/load_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLoading extends StatelessWidget {
  final Rx<LoadStatus> loadStatus;
  final String title;
  final VoidCallback buttonClick;
  final Color backgroundColor;
  final double radiusBorder;
  final double heightButton;

  const ButtonLoading({
    Key? key,
    required this.loadStatus,
    required this.title,
    required this.buttonClick,
    this.backgroundColor = Colors.red,
    this.radiusBorder = 4.0,
    this.heightButton = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonClick.call();
      },
      child: Obx(
        () {
          if (loadStatus.value == LoadStatus.loading) {
            return SizedBox(
              width: double.infinity,
              height: heightButton,
              child: const SizedBox(
                height: 18,
                width: 18,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text(title),
              ),
            );
          }
        },
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusBorder),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          fixedSize:
              MaterialStateProperty.all(Size(double.infinity, heightButton))),
    );
  }
}
