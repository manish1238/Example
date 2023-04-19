import 'package:cashking/utils/color.dart';
import 'package:cashking/widgets/common_widgets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'offer_detail_controller.dart';

class OfferDetail extends StatefulWidget {
  final String productImage;
  const OfferDetail({Key? key, required this.productImage}) : super(key: key);

  @override
  State<OfferDetail> createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> with CommonWidgets {
  final OfferDetailController controller = Get.put(OfferDetailController());
  bool isLoading = true;
  late String eventId,
      description,
      isComplete,
      payout,
      title,
      starRating,
      referWorkStation,
      users,
      withdrawAmount;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final remoteConfig = await FirebaseRemoteConfig.instance;
      await remoteConfig.fetch();
      await remoteConfig.activate();
      setState(() {
        eventId = remoteConfig.getString('eventId');
        description = remoteConfig.getString('description');
        isComplete = remoteConfig.getString('isComplete');
        payout = remoteConfig.getString('payout');
        title = remoteConfig.getString('title');
        starRating = remoteConfig.getString('StarRating');
        withdrawAmount = remoteConfig.getString('withdrawAmount');
        referWorkStation = remoteConfig.getString('referWorkStation');
        users = remoteConfig.getString('users');
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: const Text('Offer detail'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ListTile(
                  leading: Image.network(
                    widget.productImage,
                    height: 209,
                    width: 109,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          color: ColorClass.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          itemSize: 18,
                          initialRating: 4,
                          minRating: 1,
                          updateOnDrag: true,
                          glow: false,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: ColorClass.orange,
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                buildOfferDetailOpenSteps(
                  title: 'Install the application',
                  leadingIcon: 'assets/svgs/tick.svg',
                  commonColor: ColorClass.green,
                  isDetailStep: false,
                ),
                buildOfferDetailOpenSteps(
                  title: 'Complete 3 offers',
                  leadingIcon: 'assets/svgs/hourGlass.svg',
                  commonColor: ColorClass.orange,
                  isDetailStep: true,
                  detailSubTitle:
                      'Complete 3 offers Complete 3 offers Complete 3 offers Complete 3 offers Complete 3 offers Complete 3 offers Complete 3 offers',
                ),
                buildOfferDetailSteps(
                    title: 'Refer Workstation to friend',
                    rupees: referWorkStation),
                buildOfferDetailSteps(
                    title: 'Withdraw first amount', rupees: withdrawAmount),
                const Spacer(),
                buildElectricTagLine(
                    text: '$users users has already participated',
                    width: 11.74,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorClass.orange,
                    mainAxisAlignment: MainAxisAlignment.center),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 21, horizontal: 141.0),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorClass.firstBlue,
                        ColorClass.secondBlue,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    'Get \u20B9 $payout',
                    style: TextStyle(
                      fontSize: 21,
                      color: ColorClass.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
