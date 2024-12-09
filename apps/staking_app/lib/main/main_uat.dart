import 'package:staking_app/main/flavor.dart';
import 'package:staking_app/main/main.dart';

void main() {
  var flavor = Flavor(
      appTitle: "Movie App Dev", baseUrl: "https://xyz.com/", env: Env.uat);
  mainCommon(flavor);
}