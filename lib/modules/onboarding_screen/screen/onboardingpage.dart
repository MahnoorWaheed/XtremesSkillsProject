import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtremes_skills/modules/onboarding_screen/controller/onboarding_controller.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({ Key? key }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedpageindex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    //color: index==0?const Color(0xffF9C7CA): index==1?Colors.white: index==2?const Color(0xffC9CACA): Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            _controller.onboardingPages[index].imageAsset,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height*0.4,
                            width: MediaQuery.of(context).size.height*0.4,
                            ),
                        const SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style:  GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xff034baa)),
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style:  GoogleFonts.poppins(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedpageindex.value == index
                            ? Colors.white
                            : Colors.blue.shade900,
                        shape: BoxShape.circle,
                      ),
                    );

                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                elevation: 2,
                onPressed: _controller.forwardAction,
                 backgroundColor: Colors.blue.shade900,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next', 
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w900),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}