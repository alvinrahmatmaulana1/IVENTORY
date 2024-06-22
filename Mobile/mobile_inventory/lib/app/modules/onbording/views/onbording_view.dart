import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_inventory/app/widgets/OnBordingWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mobile_inventory/app/routes/app_pages.dart';
// import 'package:mobile_inventory/app/shared/theme.dart';

import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  const OnbordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            print(controller.page.value);
          }),
          children: [
            // start page onboarding
            OnBordingWidgets(
              image: 'on_boarding.jpg',
              title: 'Track Everything',
              subtitle:
                  'your financial journey start here. We are\nhere to help ypur tracking and handle every\ntransaction 24/day.',
            ),
            OnBordingWidgets(
              image: 'on_boarding1.jpg',
              title: 'Enjoy Everyday!',
              subtitle:
                  'Be wise, and discover your best financial\nexperience with us. Everything is in\nyour hands!',
            ),
            // end
          ],
        ),
        Container(
          alignment: Alignment(0.8, -0.85),
          child: GestureDetector(
            onTap: () {
              controller.indicator.jumpToPage(3);
            },
            child: Text('Skip'),
          ),
        ),
        Obx(() => Container(
              alignment: Alignment(0, 0.85),
              child: controller.page.value != 1
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 2,
                      effect: SlideEffect(
                        // activeDotColor: ,
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 8,
                        dotHeight: 8,
                        // dotColor: darkGrey,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Container(
                        height: 45,
                        width: Get.width * 0.8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Getting Started',
                          // style: semibold.copyWith(
                          //   fontSize: 18,
                          //   color: Colors.white,
                          // ),
                        ),
                      ),
                    ),
            ))
      ],
    ));
  }
}