import 'package:flutter/material.dart';
import 'package:seat_finder/cabinContainer.dart';
import 'package:seat_finder/searchbar.dart';

int selectedSeat = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
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
              SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFF3F4F8),
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
                          //validator: ,
                          maxLines: 1,
                          minLines: 1,
                          maxLength: 2,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: "Enter Seat Number...",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
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
                        setState(() {
                          selectedSeat = int.parse(controller.text);
                        });
                      },
                      child: Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text('Find'))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return cabinContainer(index: index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
