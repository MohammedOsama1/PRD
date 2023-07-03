import 'package:prd/controller/save_helper.dart';

import '../../controller/ex_file.dart';
import '../../model/onBoarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/giphy.gif'))
            ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) =>
                        buildOn(dataList[index]),
                    itemCount: 2,
                  ),
                ),
                index == 0
                    ? SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.blueAccent,
                            dotHeight: 10,
                            expansionFactor: 4,
                            dotWidth: 10,
                            spacing: 5),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: index == 0
            ? FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 666),
                      curve: Curves.fastLinearToSlowEaseIn);
                },
                child: const Icon(Icons.arrow_forward_rounded),
              )
            : null);
  }

  Column buildOn(OnBoardingModel dataList) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Spacer(),
      Image.asset(dataList.imgUrl),
      Text(
        dataList.title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        dataList.txt,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
      ),
      const SizedBox(
        height: 30,
      ),
      index == 1
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                CacheHelper.addData('onState', 'passed');
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          : Container(),
      const Spacer(),
    ]);
  }
}

List<OnBoardingModel> dataList = [
  OnBoardingModel(
      'Product Reviews Detection',
      'Find out what others have said about what you intend to buy ',
      'assets/1.jpeg'),
  OnBoardingModel('your shopping has just begun ...',
      'so tell us what are you       looking for ?', 'assets/2.jpeg'),
];
