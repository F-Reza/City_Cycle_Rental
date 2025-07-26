import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home.dart';


class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: "Discover Amazing Places",
      description: "Explore the best destinations around the world with just a few taps",
      image: "assets/images/cycle-1.png",
      color: Color(0xFF2D2E3A),
    ),
    OnboardingItem(
      title: "Plan Your Journey",
      description: "Create personalized itineraries and save your favorite spots",
      image: "assets/images/cycle-1.png",
      color: Color(0xFF4CAF50),
    ),
    OnboardingItem(
      title: "Share Experiences",
      description: "Connect with other travelers and share your adventures",
      image: "assets/images/cycle-1.png",
      color: Color(0xFFFF7043),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                item: _onboardingItems[index],
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _onboardingItems.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: _onboardingItems[_currentPage].color,
                  dotColor: Colors.grey.withOpacity(0.5),
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 10,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: _currentPage == _onboardingItems.length - 1
                ? ElevatedButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _onboardingItems[_currentPage].color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_onboardingItems.length - 1);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _onboardingItems[_currentPage].color,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
          height: 300,
          child: Image.asset(
            item.image,
            color: Color(0xFF2D2E3A),
            width: MediaQuery.of(context).size.width * 0.6,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            item.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: item.color,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            item.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;
  final Color color;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

