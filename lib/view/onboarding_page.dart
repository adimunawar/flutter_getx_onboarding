import 'package:flutter/material.dart';
import 'package:flutter_onboarding/controller/onboarding_controller.dart';
import 'package:flutter_onboarding/model/onboarding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.selectedIndex,
            itemCount: mockonBoarding.length,
            itemBuilder: (context, index) {
              return Container(
                child: Stack(
                  children: [
                    Container(
                      color: Color(0xFFECF8FF),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: (index == 0) ? 102 : 0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    mockonBoarding[index].imageAsset))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (index != 0)
                              ? GestureDetector(
                                  onTap: () {
                                    controller.beckPage();
                                  },
                                  child: Container(
                                    height: 14,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Back.png"))),
                                  ),
                                )
                              : SizedBox(),
                          (index == mockonBoarding.length - 1)
                              ? SizedBox()
                              : Text('Skip',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)))
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 30, left: 30, right: 30),
                          height: 230,
                          width: 370,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              Text(mockonBoarding[index].title,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                mockonBoarding[index].description,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF878F95))),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(
                                          mockonBoarding.length,
                                          (index) => Container(
                                                width: 18,
                                                height: 4,
                                                margin: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: (controller
                                                                .selectedIndex
                                                                .value ==
                                                            index)
                                                        ? Color(0xFF6686d8)
                                                        : Colors.grey),
                                              )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.nextPage();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Next.png'))),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
