import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/offer_detail/offer_detail.dart';
import '../utils/color.dart';

mixin CommonWidgets {
  Widget trendingOffersInfoTab({
    required String infoImage,
    required String name,
    required String rupees,
    required String users,
    required Color color,
  }) =>
      Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(
              infoImage,
              width: 180,
            ),
            Container(
              width: 180,
              padding: const EdgeInsets.only(
                  top: 12, left: 12, bottom: 10, right: 10),
              decoration: BoxDecoration(
                  color: color,
                  // color: Color(0xff200114),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: ColorClass.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    rupees,
                    style: TextStyle(
                      color: ColorClass.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 9),
                  buildElectricTagLine(
                      text: users,
                      width: 7.16,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: ColorClass.white,
                      mainAxisAlignment: MainAxisAlignment.start),
                ],
              ),
            )
          ],
        ),
      );
  Widget buildElectricTagLine({
    required String text,
    required double width,
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required MainAxisAlignment mainAxisAlignment,
  }) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SvgPicture.asset('assets/svgs/electric.svg'),
          SizedBox(width: width),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ],
      );
  Widget headTitles({required String title, required String leadingIcons}) =>
      Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SvgPicture.asset(leadingIcons),
            const SizedBox(
              width: 11,
            ),
            Text(
              title,
              style: TextStyle(
                color: ColorClass.lightGreyThree,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
  Widget buildMoreOffersListTile({
    required String title,
    required String electricData,
    required String leadingImage,
    required String rupeesButton,
    required Color color,
  }) =>
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: ColorClass.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: color,
          ),
        ),
        //We can use Random class also the change the color.
        child: ListTile(
          onTap: () => Get.to(OfferDetail(
            productImage: leadingImage,
          )),
          leading: Image.asset(leadingImage),
          title: Text(title),
          subtitle: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1,
                      color: ColorClass.firstBlue,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      rupeesButton,
                      style: TextStyle(color: ColorClass.firstBlue),
                    ),
                  )),
              const Spacer(),
              buildElectricTagLine(
                  text: electricData,
                  width: 7.16,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: ColorClass.orange,
                  mainAxisAlignment: MainAxisAlignment.center),
            ],
          ),
        ),
      );

  Widget buildOfferDetailSteps({
    required String title,
    required String rupees,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 19,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 13,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(67),
            color: ColorClass.lightGreyTwo),
        child: Row(
          children: [
            Container(
              height: 29,
              width: 29,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorClass.lightGrey,
              ),
            ),
            const SizedBox(width: 9),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.5),
                  color: ColorClass.white),
              child: Text(
                '\u20B9 $rupees',
                style: TextStyle(
                  color: ColorClass.firstBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
  Widget buildOfferDetailOpenSteps({
    required String leadingIcon,
    required String title,
    required Color commonColor,
    required bool isDetailStep,
    String? detailSubTitle,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: commonColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: commonColor,
                  ),
                  child: SvgPicture.asset(
                    leadingIcon,
                    height: 13,
                    width: 8,
                  ),
                ),
                const SizedBox(width: 9),
                Stack(children: [
                  if (isDetailStep == false)
                    Positioned(
                      top: 9,
                      child: Container(
                        height: 2,
                        width: 150,
                        color: Colors.black,
                      ),
                    ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ]),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.5),
                      color: commonColor),
                  child: Text(
                    '\u20B9 232',
                    style: TextStyle(
                      color: ColorClass.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            if (isDetailStep)
              const SizedBox(
                height: 24,
              ),
            if (isDetailStep)
              Text(
                detailSubTitle!,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorClass.grey),
              ),
          ],
        ),
      );
}
