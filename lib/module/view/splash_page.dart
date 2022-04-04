import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/module/controller/data_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Scaffold(
      body: GetBuilder<DataController>(
        init: DataController(),
        builder: (data) {
          if (data.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final item = data.dataInfo.products![index];
                return Image.network(item.thumbnail!);
              },
            );
          }
        },
      ),
    );
  }
}
