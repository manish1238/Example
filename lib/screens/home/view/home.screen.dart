import 'package:cashking/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../../all_offers.dart';
import '../controllers/home.controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});
  final List<Tab> tabs = <Tab>[
    Tab(
      child: Column(
        children: [
          SvgPicture.asset('assets/svgs/myOffers.svg'),
          const Text(
            'All Offers',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/gifts.svg'),
          const Text(
            'Gifts',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          SvgPicture.asset('assets/svgs/upComing.svg'),
          const Text(
            'Upcoming',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          SvgPicture.asset('assets/svgs/myOffers.svg'),
          const Text(
            'My Offers',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // Make the AppBar background transparent
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorClass.firstBlue,
                  ColorClass.secondBlue,
                ], // Define the gradient colors
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          elevation: 0.0,
          title: const Text('Hey Shubham'),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorClass.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorClass.secondBlue,
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/wallet.svg',
                      height: 5,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '\u20B9 439',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: SideBar(size: MediaQuery.of(context).size),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorClass.firstBlue,
                ColorClass.secondBlue,
              ], // Define the gradient colors
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: ColorClass.white),
                child: TabBar(
                  controller: controller.tabController,
                  tabs: tabs,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue.shade100,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: <Widget>[
                      // Content for Tab 1
                      const AllOffers(),
                      Container(
                        color: ColorClass.lightBlue,
                        child: const Center(
                          child: Text('Content for Tab 2'),
                        ),
                      ),
                      Container(
                        color: ColorClass.lightBlue,
                        child: const Center(
                          child: Text('Content for Tab 3'),
                        ),
                      ),
                      Container(
                        color: ColorClass.lightBlue,
                        child: const Center(
                          child: Text('Content for Tab 4'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
