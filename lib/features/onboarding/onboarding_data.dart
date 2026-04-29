import 'package:bader_app_project/features/onboarding/onboarding_model.dart';

class OnboardingData {
  static const List<OnboardingModel> imbourds = [
    OnboardingModel(
      id: 0,
      image: "assets/images/bader_logo.png",
      titleNormal: "مرحبًا بك في ",
      titleHighlight: "بادر",
      description:
          "انضم إلى شبكة متطوعين تُحدث فرقًا حقيقيًا في مجتمعك، واكتشف شغفك في خدمة الآخرين.",
    ),
    OnboardingModel(
      id: 1,
      image: "assets/images/onboarding_1.png",
      titleNormal: "اكتشف فرص التطوع",
      titleHighlight: "",
      description:
          "تصفّح فرص تتناسب مع مهاراتك ووقتك، وشارك في مبادرات قريبة منك لتترك أثراً طيباً.",
    ),
    OnboardingModel(
      id: 2,
      image: "assets/images/onboarding_2.png",
      titleNormal: "ابدأ رحلتك في التطوع",
      titleHighlight: "",
      description:
          "انضم إلى شبكة متطوعين تُحدث فرقًا حقيقيًا في مجتمعك، واكتشف شغفك في خدمة الآخرين.",
    ),
  ];
}
