
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnBoardingProvider extends ChangeNotifier{
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<Map<String,dynamic>> onboardingData = [
    {
      "title" : "Search",
      "subtitle" : "Discover the perfect train for your next adventure.",
      "animation":"lib/core/constants/assets/animations/search.json",
    },
    {
      "title" : "Pick Your Date",
      "subtitle" : "Choose the date that works best for your schedule",
      "animation":"lib/core/constants/assets/animations/Book ticket.json",
    },
    {
      "title" : "Travel Now",
      "subtitle" : "Book, board, and begin your soulful journey today",
      "animation":"lib/core/constants/assets/animations/Departure.json",
    },

  ];
  void onPageChanged(int index){
    currentPage= index;
    notifyListeners();
  }


  void nextPage(){
    if (currentPage<onboardingData.length-1) {
      pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.ease);
    }
  }

  void skipToLastPage(){
    pageController.jumpToPage(onboardingData.length-1);
  }
  bool islastPage() => currentPage==onboardingData.length-1;


Future<void> completeOnboarding() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("Onboarding Completed Successfully", true);
}
static Future<bool> isOnBoardingCompleted() async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("OnBoarding Completed")?? false;
}
}