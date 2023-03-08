import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_ui/app_assets/app_colors.dart';
import 'package:smart_home_ui/app_assets/app_style.dart';
import 'package:smart_home_ui/models/device.dart';

class DeviceItem extends StatefulWidget {
  final Device device;
  const DeviceItem({super.key, required this.device});

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: widget.device.state == "on" ? Colors.black : AppColors.gray,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, offset: Offset(3, 6), blurRadius: 4)
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, left: 10),
              child: Image.asset(
                widget.device.icon,
                height: 40,
                color:
                    widget.device.state == "on" ? Colors.white : Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.device.name,
                  style: AppStyles.devices.copyWith(
                      color: widget.device.state == "on"
                          ? Colors.white
                          : Colors.black),
                ),
                Transform.rotate(
                  angle: -pi / 2,
                  child: CupertinoSwitch(
                      activeColor: Colors.white,
                      thumbColor: widget.device.state == "on"
                          ? Colors.black
                          : AppColors.lightSwitch,
                      value: widget.device.state == "on" ? true : false,
                      onChanged: (isOn) {
                        setState(() {
                          widget.device.state =
                              widget.device.state == "on" ? "off" : "on";
                        });
                      }),
                )
              ],
            )
          ]),
    );
  }
}
