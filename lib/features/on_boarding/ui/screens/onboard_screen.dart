import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_helper_app/core/theming/colors.dart';

import '../../../../core/assets.dart';
import '../../data/models/onboard_model.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;

  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: Assets.imagesOnboardImage1,
      text: "اولا سوف تقوم بتحديد المرحلة الدراسية الخاصة بك",
      desc:
          "عندما تدخل إلى التطبيق، يجب اختيار مرحلتك الدراسية حتى تتمكن من رؤية موادك الدراسية",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: Assets.imagesOnboardImage2,
      text: "ثانياً سوف تقوم بإختيار المادة الدراسية الخاصة بك",
      desc:
          "عندما تختار المادة العلمية، ستتمكن من رؤية جميع المدرسين المتاحين لها.",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: Assets.imagesOnboardImage3,
      text: "ثالثاً سوف تقوم بإختيار طريقة تقوم بإختيار مدرس بها",
      desc: "لديك إختيارين الأول للإختيار العشوائي الثاني للإختيار اليدوي",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: Assets.imagesOnboardImage4,
      text: "رابعاً طريقة إختيار المدرس بالطريقة اليدوية ",
      desc: "ما عليك سوي الضغط علي المدرس الذي تريد ان تقوم بإختياره",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: Assets.imagesOnboardImage5,
      text: "خامساً قم بجدولة حصتك",
      desc: "هنا سوف تقوم بجدولة موعد الحصه التي تريد ان يصلك اشعار حين قدومها",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: currentIndex % 2 == 0
          ? ColorsManager.white
          : ColorsManager.secondBlueColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: currentIndex % 2 == 0
            ? ColorsManager.white
            : ColorsManager.secondBlueColor,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: TextButton(
              onPressed: () {
                _storeOnboardInfo();
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "تخطي",
                style: TextStyle(
                  color: currentIndex % 2 == 0
                      ? ColorsManager.secondBlueColor
                      : ColorsManager.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: SizedBox(
              height: 10.0,
              child: ListView.builder(
                itemCount: screens.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          width: currentIndex == index ? 25 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.amber
                                : ColorsManager.gray,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ]);
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      screens[index].img,
                      width: width - 20,
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),

                    Text(
                      screens[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GED',
                        color:
                            index % 2 == 0 ? Colors.black : ColorsManager.white,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),

                    Text(
                      screens[index].desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'GED',
                        color:
                            index % 2 == 0 ? Colors.black : ColorsManager.white,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),

                    // const Spacer(),
                    InkWell(
                      onTap: () async {
                        if (index == screens.length - 1) {
                          await _storeOnboardInfo();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePage()));
                        }

                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.blue
                                : ColorsManager.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "التالي",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: index % 2 == 0
                                        ? ColorsManager.white
                                        : Colors.blue),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: index % 2 == 0
                                    ? ColorsManager.white
                                    : Colors.blue,
                              )
                            ]),
                      ),
                    ),

                    index == 0
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () async {
                                if (index == screens.length - 1) {
                                  await _storeOnboardInfo();
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomePage()));
                                }

                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.bounceIn,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? ColorsManager.gray
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        color: index % 2 == 0
                                            ? ColorsManager.white
                                            : Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "رجوع",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: index % 2 == 0
                                                ? ColorsManager.white
                                                : Colors.blue),
                                      ),
                                    ]),
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
