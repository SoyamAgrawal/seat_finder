import 'package:flutter/material.dart';
import 'package:seat_finder/cabinContainer.dart';
import 'package:seat_finder/searchbar.dart';

int selectedSeat = 0;
bool isPressed = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seat Finder',
                  style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F8),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.blue[400]!)),
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: controller,
                            cursorColor: Colors.black87,
                            validator: (value) {
                              if (int.parse(value!) < 0 ||
                                  int.parse(value) > 72) {
                                return "Please Enter Valid Number";
                              }
                              return null;
                            },
                            maxLines: 1,
                            minLines: 1,
                            maxLength: 2,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: "Enter Seat Number...",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xff8C8FA5),
                              ),
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          isPressed = true;
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              selectedSeat = int.parse(controller.text);
                            });
                            _scrollController.animateTo(
                                200 * ((selectedSeat / 8) - 1),
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Container(
                            height: double.infinity,
                            width: 100,
                            decoration: BoxDecoration(
                              color: isPressed
                                  ? Colors.blue[500]
                                  : Colors.grey[350],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(child: Text('Find'))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 9,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 1, right: 1, top: 4.5, bottom: 4.5),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.grey,
                            child: Cabin(index:index),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


