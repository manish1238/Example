import 'dart:convert';

import 'package:cashking/widgets/common_widgets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class AllOffers extends StatefulWidget {
  const AllOffers({Key? key}) : super(key: key);

  @override
  State<AllOffers> createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> with CommonWidgets {
  late String jsona;
  late List jsonList;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final remoteConfig = await FirebaseRemoteConfig.instance;
      await remoteConfig.fetch();
      await remoteConfig.activate();

      setState(() {
        jsona = remoteConfig.getString('listOfTask');
        isLoading = false;
      });

      jsonList = json.decode(jsona) as List<dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Container(
            padding: const EdgeInsets.only(top: 10),
            color: ColorClass.lightBlue,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  color: ColorClass.lightGreyFive,
                  child: RichText(
                    text: TextSpan(
                      text: 'Sameer earned ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: ColorClass.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' 452',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: ColorClass.lightBlueTwo),
                        ),
                        TextSpan(
                          text: ' from BookMyShow offer',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: ColorClass.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                headTitles(
                    title: 'Trending offers',
                    leadingIcons: 'assets/svgs/trendingOffers.svg'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          trendingOffersInfoTab(
                            infoImage: 'assets/pngs/girl.png',
                            name: 'Alto\'s Odysseyz',
                            rupees: 'Get Rs. 230',
                            users: '4,687 users',
                            color: const Color(0xff200114),
                          ),
                          trendingOffersInfoTab(
                            infoImage: 'assets/pngs/tt.png',
                            name: '2 Player Games',
                            rupees: 'Get Rs. 100',
                            users: '4,687 users',
                            color: const Color(0xff362600),
                          ),
                          trendingOffersInfoTab(
                            infoImage: 'assets/pngs/girl.png',
                            name: 'Kim\'s Odysseyz',
                            rupees: 'Get Rs. 130',
                            users: '4,680 users',
                            color: const Color(0xff252E06),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                headTitles(
                    title: 'More offers',
                    leadingIcons: 'assets/svgs/moreOffers.svg'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: jsonList.length,
                          itemBuilder: (context, index) {
                            return buildMoreOffersListTile(
                              title: jsonList[index]['title'],
                              electricData: jsonList[index]['payout'],
                              leadingImage: jsonList[index]['thumbnail'],
                              rupeesButton: 'Get ${jsonList[index]['earned']}',
                              color: ColorClass.green,
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
