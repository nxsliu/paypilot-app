import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/layout/position_bottom.dart';
import 'package:paypilot/ui/views/authentication/welcome/welcome_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        viewModelBuilder: () => WelcomeViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                  child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Image.asset(
                          'assets/images/paypilot_logo_black.png',
                          //scale: 1.5,
                          width: 200,
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 400.0,
                              //aspectRatio: 1 / 1,
                              autoPlay: false,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) =>
                                  model.updateCarouselSliderDot(index)),
                          items: [
                            'assets/images/welcome_1.png',
                            'assets/images/welcome_2.png'
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.asset(
                                  i,
                                  fit: BoxFit.fitWidth,
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 2; i++)
                              Container(
                                height: 10,
                                width: 10,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: model.currentIndex == i
                                      ? PayPilotTheme.primaryColour
                                      : PayPilotTheme.babyBlueColour,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PositionBottom(
                      child: Column(
                    children: [
                      PrimaryButton(
                          onPressed: model.navigateToOnboardingName,
                          text: 'Get Started'),
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: model.navigateToSignIn,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.black),
                                )
                              ])),
                    ],
                  ))
                ],
              )),
            ));
  }
}
