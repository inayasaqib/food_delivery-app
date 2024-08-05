import 'package:food_delivery/app/app.locator.dart';
import 'package:food_delivery/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuViewmodel extends BaseViewModel{
    final navigationservice = locator<NavigationService>();
    nav(){
      navigationservice.navigateToFoodView();
    }
}