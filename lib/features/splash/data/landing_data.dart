import 'package:nestify/features/splash/data/models/landing_model.dart';

class LandingData {
  static List<LandingModel> landingList = [
    const LandingModel(
      assetIamge: 'assets/images/villa1.png',
      title: 'Welcome to Nestify\n - Your Ultimate \nRental Solution!',
      subTitle:
          'start your journey to finding the perfect rental home \neffortlessly with our comprehensive platform.',
    ),
    const LandingModel(
      assetIamge: 'assets/images/villa2.png',
      title: 'Explore Nearby\nApartments',
      subTitle:
          'Dive into a world of possibilities as younexplore rental \n properties in your desired location, tail to your \n preferences.',
    ),
    const LandingModel(
      assetIamge: 'assets/images/villa3.png',
      title: 'Book Youy Dream\nHome',
      subTitle:
          'Experience the convenience of booking your dream \n rental home hassle-free. ensuring a seamless transition\n to your new living space. ',
    ),
  ];

  static int currentPage = 0;
}
