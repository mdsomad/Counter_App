import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tsv_count_app/Boxes/boxes.dart';
import 'package:tsv_count_app/Global/Global.dart';
import 'package:tsv_count_app/Provider/Home_Screen_Provider.dart';
import 'package:tsv_count_app/Screens/Widgets/button.dart';
import 'package:tsv_count_app/Screens/Widgets/description_widget.dart';
import 'package:tsv_count_app/models/counter_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController setCounterRangeController =
      TextEditingController();

  bool checkDate = false;

  var _locations = ['None', 'Set Counter Range'];
  String selectedLocation = 'None';

  //TODO Create addCounter Function
  void addCounterFuntcion() {
    String generatorUniqueId = GlobalClass.idGenerator();
    final CounterModel data = CounterModel(
        id: generatorUniqueId,
        isPinned: false,
        counter_value: 0,
        counter_range_value: selectedLocation == "None"
            ? 0
            : int.parse(setCounterRangeController.text),
        title: "",
        description: descriptionController.text.toString(),
        isEdited_now: true,
        dateadded: DateTime.now());

    final Box<CounterModel> box = Boxes.getData();
    box.add(data);
    print(box);
    data.save();
    selectedLocation = 'None';
    descriptionController.clear();
    setCounterRangeController.clear();
  }

  //TODO Create updateCounter Function
  void updateCounterFuntcion(CounterModel counterModel) async {
    if (selectedLocation == "None") {
      counterModel.counter_range_value = 0;
    } else {
      counterModel.counter_range_value =
          int.parse(setCounterRangeController.text);
    }

    counterModel.isEdited_now = true;
    counterModel.description = descriptionController.text.toString();

    await counterModel.save();
    descriptionController.clear();
    setCounterRangeController.clear();
    selectedLocation == "None";
  }

  //TODO Create delete Function
  void deleteFunction(CounterModel counterModel) async {
    await counterModel.delete();
    // Boxes.getData().clear();  //* <-- ALl Data deleted
  }

  void incrementCounter(CounterModel counterModel) async {
    if (counterModel.counter_range_value != 0 &&
        counterModel.counter_value == counterModel.counter_range_value) {
      counterModel.isEdited_now = true;
      counterModel.counter_value = 0;
      await counterModel.save();
    } else {
      counterModel.isEdited_now = true;
      counterModel.counter_value = counterModel.counter_value + 1;
      await counterModel.save();
    }
  }

  void decrementCounter(CounterModel counterModel) async {
    counterModel.isEdited_now = true;
    counterModel.counter_value = counterModel.counter_value - 1;
    await counterModel.save();
  }

  void clearCounter(CounterModel counterModel) async {
    counterModel.isEdited_now = true;
    counterModel.counter_value = 0;
    await counterModel.save();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    descriptionController.dispose();
    setCounterRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * 1;
    double screenWidth = MediaQuery.of(context).size.width * 1;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        // backgroundColor: Color(0xff1A1717),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showdAddAndEditDialog(
                isEditDialog: false,
                description: "",
                screenHeight: screenHeight,
                counterModel: CounterModel(
                    id: "",
                    isPinned: false,
                    counter_value: 0,
                    counter_range_value: 0,
                    title: "",
                    description: descriptionController.text.toString(),
                    isEdited_now: true,
                    dateadded: DateTime.now()));
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(child: Consumer<HomeScreenProvider>(//* <-- Provider Use
            builder: (context, provider, child) {
          return ValueListenableBuilder<Box<CounterModel>>(
            valueListenable: Boxes.getData().listenable(),
            builder: (context, box, _) {
              List<CounterModel> counteDataList =
                  box.values.toList().cast<CounterModel>();

              return counteDataList.isEmpty
                  ? SizedBox()
                  : ListView.builder(
                      itemCount: counteDataList.length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.01,
                                right: screenWidth * 0.01,
                                top: screenHeight * 0.015,
                                bottom:
                                    counteDataList[index] == counteDataList.last
                                        ? screenHeight * 0.09
                                        : 0),
                            child: GestureDetector(
                              onLongPress: () {
                                _showdAddAndEditDialog(
                                  isEditDialog: true,
                                  screenHeight: screenHeight,
                                  description:
                                      counteDataList[index].description,
                                  counterModel: counteDataList[index],
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xff222831),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: screenHeight * 0.01,
                                  children: [
                                    ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Color(0xff16FF00),
                                              width: 3,
                                            ),
                                          ),
                                          child: Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth * 0.01),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                counteDataList[index]
                                                    .counter_value
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                        ),
                                        title: Visibility(
                                          visible: counteDataList[index]
                                                  .counter_range_value !=
                                              0,
                                          child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.blueGrey,
                                                width: 3,
                                              ),
                                            ),
                                            child: Center(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidth * 0.03),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    "Counter Range : ${counteDataList[index].counter_range_value}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        trailing:
                                            counteDataList[index].isEdited_now
                                                ? Text(
                                                    "Last Updated",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : SizedBox()),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.03),
                                        child: DescriptionTextShowWidget(
                                            text: counteDataList[index]
                                                .description)

                                        // Text(
                                        //   "Somad Amir Hello okmkos dmjnds nijsnd ijknsdjnsjdn",
                                        //   style: TextStyle(
                                        //       letterSpacing: 2,
                                        //       color: Colors.white,
                                        //       fontSize: 23,
                                        //       fontWeight: FontWeight.w500),
                                        // ),
                                        ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 15,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkDate = !checkDate;
                                              });
                                            },
                                            child: Text(
                                              DateFormat(checkDate == true
                                                      ? 'd MMM y'
                                                      : "hh:mm aaa")
                                                  .format(counteDataList[index]
                                                      .dateadded),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Spacer(),
                                          Button(
                                            icon: Icon(Icons.clear),
                                            onPressed: () async {
                                              log("Button Pressed 👉 Clear");
                                              {
                                                for (var i = 0;
                                                    i < counteDataList.length;
                                                    i++) {
                                                  if (counteDataList[i]
                                                          .isEdited_now ==
                                                      true) {
                                                    counteDataList[i]
                                                        .isEdited_now = false;
                                                    await counteDataList[i]
                                                        .save();
                                                  }
                                                }
                                              }
                                              clearCounter(
                                                  counteDataList[index]);
                                            },
                                          ),
                                          Button(
                                            icon: Icon(Icons.remove),
                                            onPressed: () async {
                                              log("Button Pressed 👉 Decrement");
                                              {
                                                for (var i = 0;
                                                    i < counteDataList.length;
                                                    i++) {
                                                  if (counteDataList[i]
                                                          .isEdited_now ==
                                                      true) {
                                                    counteDataList[i]
                                                        .isEdited_now = false;
                                                    await counteDataList[i]
                                                        .save();
                                                  }
                                                }
                                              }
                                              if (counteDataList[index]
                                                      .counter_value !=
                                                  0) {
                                                decrementCounter(
                                                    counteDataList[index]);
                                              }
                                            },
                                          ),
                                          Button(
                                            icon: Icon(Icons.add),
                                            onPressed: () async {
                                              log("Button Pressed 👉 Increment");
                                              {
                                                for (var i = 0;
                                                    i < counteDataList.length;
                                                    i++) {
                                                  if (counteDataList[i]
                                                          .isEdited_now ==
                                                      true) {
                                                    counteDataList[i]
                                                        .isEdited_now = false;
                                                    await counteDataList[i]
                                                        .save();
                                                  }
                                                }
                                              }
                                              incrementCounter(
                                                  counteDataList[index]);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
            },
          );
        })));
  }

  //TODO Create Data Add ShowDialog Function
  Future<void> _showdAddAndEditDialog(
      {required bool isEditDialog,
      required CounterModel counterModel,
      required String description,
      required double screenHeight}) {
    if (isEditDialog) {
      descriptionController.text = description;
      if (counterModel.counter_range_value != 0) {
        setCounterRangeController.text =
            counterModel.counter_range_value.toString();

        selectedLocation = 'Set Counter Range';
      }
    }

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: isEditDialog
                ? Text("Edit Counting Event")
                : Text("Add Counting Event"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  //! 👇 Currently Not Uesd DropDownMenu
                  // DropDownMenu(),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedLocation,
                    enableFeedback: true,
                    // icon: const Icon(Icons.arrow_circle_down),
                    icon: const Icon(Icons.expand_circle_down),
                    iconSize: 20,
                    elevation: 16,
                    underline: Container(),
                    onChanged: (String? newValue) {
                      log("Selected DropdownButton Value: 👉 $newValue");
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },

                    items: List.generate(
                      _locations.length,
                      (index) => DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_locations[index]),
                        ),
                        value: _locations[index],
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        selectedLocation == 'Set Counter Range' ? true : false,
                    child: TextFormField(
                      controller: setCounterRangeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Set Counter Range",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.013,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: "Enter description",
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
            actions: [
              Visibility(
                visible: isEditDialog,
                child: TextButton(
                    onPressed: () {
                      deleteFunction(counterModel);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
              TextButton(
                  onPressed: () {
                    selectedLocation = 'None';
                    descriptionController.clear();
                    setCounterRangeController.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              // TextButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    if (isEditDialog) {
                      updateCounterFuntcion(counterModel);
                    } else {
                      addCounterFuntcion();
                    }
                    Navigator.pop(context);
                  },
                  child: isEditDialog ? Text("Edit") : Text("Add"))
            ],
          );
        });
      },
    );
  }
}
