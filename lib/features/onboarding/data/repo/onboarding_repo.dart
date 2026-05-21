import '../../../../core/app_manager/app_images.dart';
import '../model/onboarding_model.dart';

 class OnboardingRepo {
 static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: AppImages.alejandrao,
      icon: AppImages.documentIcon,
      text: "Order for Food",
    ),

    OnBoardingModel(
      image: AppImages.chocolateBrownie,
      icon: AppImages.cardIcon,
      text: "Easy Payment",
    ),

    OnBoardingModel(
      image: AppImages.coffee,
      icon: AppImages.deliverIcon,
      text: "Fast Delivery",
    ),
  ];
}