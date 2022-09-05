import 'package:fima/core/view_models/implements/splash_screen_view_model.dart';
import 'package:fima/core/view_models/interfaces/isplash_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<ISplashScreenViewModel>(
    create: (_) => SplashScreenViewModel(),
  ),
];
