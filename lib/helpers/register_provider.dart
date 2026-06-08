import 'package:provider/provider.dart';
import 'package:tally_khata/provider/carosul_provider.dart';
import 'package:tally_khata/provider/customer_provider.dart';
import 'package:tally_khata/provider/forget_password_provider.dart';
import 'package:tally_khata/provider/profile_provider.dart';
import 'package:tally_khata/provider/singnup_provider.dart';

var providers = [
  ChangeNotifierProvider<ForgetPasswordProvider>(
    create: ((context) => ForgetPasswordProvider()),
  ),

  ChangeNotifierProvider<SignupProvider>(
    create: ((context) => SignupProvider()),
  ),

  ChangeNotifierProvider<ProfileProvider>(
    create: ((context) => ProfileProvider()),
  ),

  ChangeNotifierProvider<CarosulProvider>(
    create: ((context) => CarosulProvider()),
  ),

  ChangeNotifierProvider<CustomerProvider>(
    create: ((context) => CustomerProvider()),
  ),
];
