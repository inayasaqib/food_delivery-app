import 'package:food_delivery/app/app.locator.dart';
import 'package:food_delivery/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FoodViewmodel extends BaseViewModel{
    final navigationservice = locator<NavigationService>();
    bool? isChacked = false;
    nav(){
 navigationservice.navigateToCartScreen();
}
}