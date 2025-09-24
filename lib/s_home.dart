import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/controller/c_home.dart';
import 'package:weather_application/core/util/constats/all_enum.dart';
import 'package:weather_application/core/util/constats/constants.dart';
import 'package:weather_application/core/util/widgets/w_bottom_rounded_button.dart';
import 'package:weather_application/core/util/widgets/w_item_tile.dart';

import 'core/util/widgets/w_vertical_divider.dart';

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
                getDropDownSearch(
                  onChanged: (val) {
                    cHome.setCountry(val ?? "");
                  },
                  label: "Country",
                  hintText: "Select a Country",
                  key: dropdownKey1,
                  list: cHome.countryList,
                  disableList: cHome.disabledCountryList,
                ),
                getDropDownSearch(
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
          Obx(
            () => WBottomRoundedButton(
              label: 'Check',
              isEnabled: cHome.selectedCountry.isNotEmpty&&cHome.selectedDistic.isNotEmpty,
              isLoading:
                  Get.find<CHome>().currentState.value == HomeState.loading,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget getDropDownSearch({
    required String label,
    required String hintText,
    required var key,
    required List<String> list,
    required List<String> disableList,
    required Function(String?) onChanged,
  }) {
    return DropdownSearch<String>(
      enabled: true,
      key: key, // Needed for reset
      // asyncItems: (String filter) => _getAllMemberData(),
      items: (filter, y) async {
        await Future.delayed(Duration(milliseconds: 400));
        return list;
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),

      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? "");
      },

      popupProps: PopupProps.menu(
        showSearchBox: true,
        disabledItemFn: (item) {
          return disableList.contains(item);
        },
        showSelectedItems: true,
        itemBuilder: (context, item, isDisabled, isSelected) {
          //to check isSelected required "showSelectedItems == true"
          // Disable specific item visually and functionally
          return ListTile(
            title: Text(
              item,
              style: TextStyle(
                color: isDisabled ? Colors.grey : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
      // always use this function it's tested
      // otherwise we get error because there are few bug here
      onChanged: onChanged,
    );
  }
}
