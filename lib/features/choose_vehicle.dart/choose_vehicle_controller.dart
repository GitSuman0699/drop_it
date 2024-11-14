import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class ChooseVehicleController extends GetxController {
  final vehicleoptions = [
    {
      'title': 'Bike',
      'description': 'You drive a motorbike or Scooter',
      'vehicle_image': TImages.bikeIcon,
    },
    {
      'title': 'Car',
      'description': 'You have a car that you wish to drive',
      'vehicle_image': TImages.carIcon,
    },
    {
      'title': 'Van',
      'description': 'You have a van that you wish to drive',
      'vehicle_image': TImages.vanIcon,
    },
    {
      'title': 'Truck',
      'description': 'You have a truck that you wish to drive',
      'vehicle_image': TImages.truckIcon,
    }
  ];

  RxInt vehicleOptionTappedIndex = 0.obs;
}
