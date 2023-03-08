import 'package:flutter/material.dart';
import 'package:smart_home_ui/app_assets/app_icons.dart';
import 'package:smart_home_ui/app_assets/app_style.dart';
import 'package:smart_home_ui/widgets.dart/widgets.dart';

import 'models/device.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Device> devices = [
      Device(name: "Smart\nLight", state: "on", icon: AppIcons.lightBuld),
      Device(name: "Smart\nAC", state: "off", icon: AppIcons.airConditioner),
      Device(name: "Smart\nTV", state: "off", icon: AppIcons.smartTV),
      Device(name: "Smart\nFan", state: "off", icon: AppIcons.fan)
    ];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(AppIcons.menu)),
                      const Icon(
                        Icons.person,
                        size: 50,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Home",
                          style: AppStyles.welcome,
                        ),
                        Text(
                          "Garret Reynodls",
                          style: AppStyles.name,
                        )
                      ]),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Smart Devices",
                    style: AppStyles.name.copyWith(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 20),
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      return DeviceItem(device: devices[index]);
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
