import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_application/core/controller/c_base.dart';
import 'package:weather_application/core/model/m_weather.dart';
import 'package:weather_application/core/util/constats/all_enum.dart';
import 'package:weather_application/presentation/home/data/services/home_services.dart';

class CHome extends CBase {

  // var currentState = HomeState.initial.obs;

  var _selectedCountry = "".obs;
  var _selectedDistic = "".obs;
  
  List<String> _disabledDisticList = ["Brahmanbaria"];
  List<String> _disticsList = ["Cumilla", "Brahmanbaria", "Feni", "Dhaka", "Chattogram", "Habiganj", "bijhgjh jgjh"];
  List<String> _disabledCountryList = ["Brahmanbaria"];
  List<String> _countryList = ["Bangladesh", "India", "Nepal", "Us", "Canada", "Englend", "bijhgjh jgjh"];
  MWeather? _mWather;  

  List<String> get disabledDisticList  =>_disabledDisticList;
  List<String> get disticsList         =>_disticsList;
  List<String> get disabledCountryList =>_disabledCountryList;
  List<String> get countryList         =>_countryList;
  Rx<String> get selectedCountry       =>_selectedCountry;
  Rx<String> get selectedDistic        =>_selectedDistic;

  MWeather? get mWather =>_mWather;

  void notify(){
    update();
  }

  void setDistic(String dist){
    _selectedDistic.value = dist;
  }

  void setCountry(String country){
    _selectedCountry.value = country;
  }

  void setViewState(ViewState state){
    viewState = state;
    notify();
  }

  void setMWeather(MWeather mWather){
    _mWather = mWather;
    notify();
  }

  void getWatherData(String distic, String country)async{
    _mWather = null;
    setViewState(ViewState.loading);
    try {
      HomeServices homeServices = HomeServices();
      MWeather data =  await homeServices.getWatherInfo(location: "$distic, $country");
      setMWeather(data);
      setViewState(ViewState.loaded);
      
    } catch (error, stackTrace) {
      setException(error: error, stackTrace: stackTrace);
      // Get.snackbar("title", error.toString());
    }
  }
}