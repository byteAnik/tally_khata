import 'package:country_city_kit/country_city_kit.dart';
import 'package:flutter/material.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedCountry;
  String? selectedCity;

  List<String> countries = [];
  List<String> cities = [];

  @override
  void initState() {
    super.initState();
    countries = CountryCityData.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                /// ================= COUNTRY =================
                DropdownButtonFormField<String>(
                  initialValue: selectedCountry,
                  decoration: const InputDecoration(
                    labelText: "Country",
                    border: OutlineInputBorder(),
                  ),
                  items: countries
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;

                      // 🔥 Load cities instead of states
                      cities = CountryCityData.getCities(value!);

                      selectedCity = null;
                    });
                  },
                ),

                const SizedBox(height: 16),

                /// ================= CITY =================
                DropdownButtonFormField<String>(
                  initialValue: selectedCity,
                  decoration: const InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                  items: cities
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
