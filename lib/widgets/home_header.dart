import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather_app/common/wcolors.dart';

class HomeHeader extends StatelessWidget {
  final String location;
  final TextEditingController locationController;
  final Function getWeatherData;

  const HomeHeader({super.key, required this.location, required this.locationController, required this.getWeatherData});

  @override
  Widget build(BuildContext context) {
    final WColors _colors = WColors();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/menu.png',
          width: 30,
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pin.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            IconButton(
              onPressed: () {
                locationController.clear();
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Container(
                      // height: size.height * .2,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context)
                            .viewInsets
                            .bottom,
                        top: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 70,
                            child: Divider(
                              thickness: 3.5,
                              color: _colors.primaryColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_downward_rounded,
                                color: _colors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (searchText) {
                              getWeatherData(searchText);
                            },
                            // onSubmitted: (String val) => Navigator.pop(context),
                            controller: locationController,
                            autofocus: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: _colors.primaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    locationController.clear(),
                                child: Icon(
                                  Icons.close,
                                  color: _colors.primaryColor,
                                ),
                              ),
                              hintText: 'Search city e.g. Surat',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _colors.primaryColor,
                                ),
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/profile.jpeg',
            width: 30,
            height: 30,
          ),
        )
      ],
    );
  }
}
