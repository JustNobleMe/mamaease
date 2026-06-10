class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingData> onboardingPages = [
  OnboardingData(
    image: 'assets/images/onboarding1.png',
    title: 'Track Your Pregnancy',
    description:
        'Monitor your pregnancy journey week by week with personalized insights.',
  ),
  OnboardingData(
    image: 'assets/images/onboarding2.png',
    title: 'Consult Trusted Doctors',
    description:
        'Book appointments and connect with qualified maternal healthcare professionals.',
  ),
  OnboardingData(
    image: 'assets/images/onboarding3.png',
    title: 'Stay Healthy',
    description:
        'Access prenatal exercises, reminders, and expert guidance throughout your pregnancy.',
  ),
];
