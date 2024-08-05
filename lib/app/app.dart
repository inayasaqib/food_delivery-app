import 'package:food_delivery/ui/views/cart/cartscreen.dart';
import 'package:food_delivery/ui/views/foodview/foodview.dart';
import 'package:food_delivery/ui/views/resturant/menu_view.dart';
import 'package:food_delivery/ui/views/home/home_view.dart';
import 'package:food_delivery/ui/views/login/login_view.dart';
import 'package:food_delivery/ui/views/map/map.dart';
import 'package:food_delivery/ui/views/signup/signupview.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView, initial: true,),
    MaterialRoute(page: Signup,),
    MaterialRoute(page: Homeview,),
    MaterialRoute(page: MapScreen, initial: false,),
    MaterialRoute(page: MenuView),
    MaterialRoute(page: FoodView),
     MaterialRoute(page: CartScreen,),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
)
class App {}
