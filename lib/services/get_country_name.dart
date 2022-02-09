import 'package:country_provider2/country_provider2.dart';
import 'package:flutter/cupertino.dart';

class CountryProviderService {
  CountryFilter filter = CountryFilter();
  final CountryProvider _countryProvider = CountryProvider();

  Future getCountryName({@required countryCode}) async {
    try {
      Country result = await _countryProvider.getCountryByCode(countryCode,
          filter: CountryFilter());
      return result;
    } catch (e) {
      return print(e);
    }
  }
}
