
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/presentation/home/controller/c_home.dart';
import 'package:weather_application/core/util/constats/all_enum.dart';
import 'package:weather_application/core/util/widgets/w_drop_down_search.dart';
import 'package:weather_application/core/util/widgets/w_bottom_rounded_button.dart';
import 'package:weather_application/core/util/widgets/w_item_tile.dart';


class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  final dropdownKey1 = GlobalKey<DropdownSearchState>();
  final dropdownKey2 = GlobalKey<DropdownSearchState>();
  // String selectedItem = "";

  @override
  Widget build(BuildContext context) {
    final CHome cHome = Get.put(CHome());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("Weather Application"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              spacing: 10,
              children: [
                WDropDownSearch(
                  onChanged: (val) {
                    cHome.setCountry(val ?? "");
                  },
                  label: "Country",
                  hintText: "Select a Country",
                  key: dropdownKey1,
                  list: cHome.countryList,
                  disableList: cHome.disabledCountryList,
                ),
                WDropDownSearch(
                  onChanged: (val) {
                    cHome.setDistic(val ?? "");
                  },
                  label: "Distic",
                  hintText: "Select a Distic",
                  key: dropdownKey2,
                  list: cHome.disticsList,
                  disableList: cHome.disabledDisticList,
                ),
              ],
            ),
          ),
          
          Expanded(
            child: GetBuilder<CHome>(
              init: CHome(),
              builder: (cHome) {
                return cHome.mWather == null
                    ? SizedBox.shrink()
                    : Card(
                        color: Colors.green[50],
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20, top: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Field",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Value",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      WItemTile(
                                        field: "Zoon Name",
                                        value: cHome.mWather!.location.name,
                                      ),
                                      WItemTile(
                                        field: "Country",
                                        value: cHome.mWather!.location.country,
                                      ),
                                      WItemTile(
                                        field: "Local Time",
                                        value:
                                            cHome.mWather!.location.localtime,
                                      ),
                                      WItemTile(
                                        field: "Time Zoon ID",
                                        value: cHome.mWather!.location.tzId,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Weather Info"),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      WItemTile(
                                        field: "Last update",
                                        value:
                                            cHome.mWather!.current.lastUpdated,
                                      ),
                                      WItemTile(
                                        field: "Condition",
                                        value: cHome
                                            .mWather!
                                            .current
                                            .condition
                                            .text,
                                      ),
                                      WItemTile(
                                        field: "Day",
                                        value: cHome.mWather!.current.isDay == 1
                                            ? "Yes"
                                            : "No",
                                      ),
                                      WItemTile(
                                        field: "Wind Direction",
                                        value: cHome.mWather!.current.windDir,
                                      ),
                                      WItemTile(
                                        field: "Wind Speed",
                                        value: cHome.mWather!.current.windKph
                                            .toString(),
                                      ),
                                      WItemTile(
                                        field: "UV Ray",
                                        value: cHome.mWather!.current.uv
                                            .toString(),
                                      ),
                                      WItemTile(
                                        field: "Air Pressure",
                                        value:
                                            "${cHome.mWather!.current.pressureIn} IN",
                                      ),
                                      WItemTile(
                                        field: "Cloud",
                                        value:
                                            "${cHome.mWather!.current.cloud} %",
                                      ),
                                      WItemTile(
                                        field: "Humidity",
                                        value: cHome.mWather!.current.humidity
                                            .toString(),
                                      ),
                                      WItemTile(
                                        field: "Temparature",
                                        value: "${cHome.mWather!.current.tempC} C",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),

          SizedBox(height: 30),
          GetBuilder<CHome>(
            builder: (cHome) {
              return  WBottomRoundedButton(
                  label: 'Check',
                  isEnabled:()=>cHome.selectedCountry.value.isNotEmpty && cHome.selectedDistic.value.isNotEmpty,
                  isLoading: Get.find<CHome>().viewState == ViewState.loading,
                  ontap: () {
                    cHome.getWatherData(
                      cHome.selectedDistic.value,
                      cHome.selectedCountry.value,
                    );
                  },
                  onError: () {
                    Get.snackbar(
                      colorText: Colors.white,
                      backgroundColor: Colors.black,
                      "Info", "Please fill all required Field!");
                  },
              );
            }
          ),
        ],
      ),
    );
  }

}

