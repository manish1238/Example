import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/color.dart';

class SideBar extends StatefulWidget {
  final Size size;
  const SideBar({
    Key? key,
    required this.size,
  }) : super(key: key);
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: widget.size.width * 0.6,
        color: ColorClass.white,
        child: Column(
          children: [
            Container(
              height: widget.size.height * 0.2,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorClass.secondBlue,
                    ColorClass.firstBlue,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: ColorClass.white,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/pngs/profileImage.png',
                        height: 60,
                      ),
                    ),
                  ),
                  Text(
                    'Shubham Kumar',
                    style: TextStyle(
                      color: ColorClass.white,
                    ),
                  ),
                  Text(
                    'shubhamkumar@cashup.com',
                    style: TextStyle(
                      color: ColorClass.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  sideBarMenuItems(
                      title: 'My Offers',
                      leadingIcon: 'assets/svgs/myOffers.svg',
                      trailingIcon: 'assets/svgs/sideArrow.svg'),
                  sideBarMenuItems(
                      title: 'App Usage',
                      leadingIcon: 'assets/svgs/app_usage.svg',
                      trailingIcon: 'assets/svgs/sideArrow.svg'),
                  sideBarMenuItems(
                      title: 'Support',
                      leadingIcon: 'assets/svgs/support.svg',
                      trailingIcon: 'assets/svgs/Vector.svg'),
                  sideBarMenuItems(
                      title: 'Terms & Conditions',
                      leadingIcon: 'assets/svgs/t&c.svg',
                      trailingIcon: 'assets/svgs/Vector.svg'),
                  sideBarMenuItems(
                      title: 'Privacy Policy',
                      leadingIcon: 'assets/svgs/pp.svg',
                      trailingIcon: 'assets/svgs/Vector.svg'),
                  sideBarMenuItems(
                      title: 'Rate Us',
                      leadingIcon: 'assets/svgs/rateUs.svg',
                      trailingIcon: 'assets/svgs/sideArrow.svg'),
                  sideBarMenuItems(
                      title: 'Language',
                      leadingIcon: 'assets/svgs/language.svg',
                      trailingIcon: 'assets/svgs/sideArrow.svg'),
                  sideBarMenuItems(
                    title: 'Logout',
                    trailingIcon: '',
                    leadingIcon: 'assets/svgs/logOut.svg',
                  ),
                ],
              ),
            ),
            const Text(
              'Follow us',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pngs/fb.png',
                  height: 20,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/pngs/insta.png',
                  height: 20,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/pngs/utube.png',
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget sideBarMenuItems({
    required String title,
    required String leadingIcon,
    required String trailingIcon,
  }) =>
      Column(
        children: [
          ListTile(
            onTap: () async {},
            leading: SvgPicture.asset(
              leadingIcon,
              color: ColorClass.lightBlueTwo,
            ),
            title: Text(title),
            trailing: SvgPicture.asset(
              trailingIcon,
              color: ColorClass.lightGreyFour,
            ),
          ),
          const Divider(),
        ],
      );
}
