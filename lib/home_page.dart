import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/controller/home_controller.dart';
import 'package:weather_application/core/util/widgets/bottom_rounded_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dropdownKey1 = GlobalKey<DropdownSearchState>();
  final dropdownKey2 = GlobalKey<DropdownSearchState>();
  // String selectedItem = "";

  @override
  Widget build(BuildContext context) {
    CHome cHome = Provider.of<CHome>(context, listen: true);
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
                  label: "Country",
                  hintText: "Select a Country",
                  key: dropdownKey1,
                  list: cHome.countryList,
                  disableList: cHome.disabledCountryList,
                ),
                getDropDownSearch(
                  label: "Distic",
                  hintText: "Select a Distic",
                  key: dropdownKey2,
                  list: cHome.disticsList,
                  disableList: cHome.disabledDisticList,
                ),
              ],
            ),
          ),

          if (cHome.wModel != null)
            Expanded(
              child: Card(
                color: Colors.green[50],
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, top: 10),
                  height: 1000,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Field", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                            Text("Value", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                
                      Divider(),
                
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              getItemTile("Zoon Name", cHome.wModel!.location.name),
                              getItemTile("Country", cHome.wModel!.location.country),
                              getItemTile("Local Time", cHome.wModel!.location.localtime),
                              getItemTile("Time Zoon ID", cHome.wModel!.location.tzId),
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
                              getItemTile("Last update", cHome.wModel!.current.lastUpdated),
                              getItemTile("Condition", cHome.wModel!.current.condition.text),
                              getItemTile("Day", cHome.wModel!.current.isDay==1?"Yes" : "No"),
                              getItemTile("Wind Direction", cHome.wModel!.current.windDir),
                              getItemTile("Wind Speed", cHome.wModel!.current.windKph.toString()),
                              getItemTile("UV Ray", cHome.wModel!.current.uv.toString()),
                              getItemTile("Air Pressure", cHome.wModel!.current.pressureIn.toString() + " IN"),
                              getItemTile("Cloud", cHome.wModel!.current.cloud.toString() +" %"),
                              getItemTile("Humidity", cHome.wModel!.current.humidity.toString()),
                              getItemTile("Temparature", cHome.wModel!.current.tempC.toString() +" C"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          getBottomRoundedButton(
            label: 'Check',
            ontap: () {
              var selectedCountry = dropdownKey1.currentState?.getSelectedItem;
              var selectedDistic = dropdownKey2.currentState?.getSelectedItem;
              if (selectedDistic != null && selectedCountry != null) {
                cHome.getWatherData(selectedDistic, selectedCountry);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please Field All Required Field!")),
                );
              }
            },
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
          hintText: "$hintText",
          border: OutlineInputBorder(),
        ),
      ),

      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? "");
      },

      popupProps: PopupProps.menu(
        showSearchBox: true,

        // title: Text("sdf"),
        disabledItemFn: (item) {
          return disableList.contains(item);
        },

        // Disable specific item visually and functionally
        showSelectedItems: true,
        itemBuilder: (context, item, isDisabled, isSelected) {
          //to check isSelected required "showSelectedItems == true"

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
      onChanged: (value) {},
    );
  }

  Widget getVerticalDevider({
    Color? color,
    double width = 1,
    double height = 20,
  }) {
    return Container(
      height: height,
      width: width,
      color: color ?? Colors.grey.shade300,
    );
  }

  Widget getItemTile(String field, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // field input field
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: AutoSizeText(
                field,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                minFontSize: 12,
              ),
            ),
          ),

          getVerticalDevider(),

          // value
          SizedBox(
            width: 120,
            child: Center(
              child: AutoSizeText(
                value,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                minFontSize: 8,
              ),
            ),
          ),

          getVerticalDevider(),
        ],
      ),
    );
  }
}
