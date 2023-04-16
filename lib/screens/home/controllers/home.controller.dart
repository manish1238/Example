import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      update(); // notify GetX that the selected tab has changed
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
