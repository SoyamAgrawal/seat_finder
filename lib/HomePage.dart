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
  final _scrollController = ScrollController();
  final _formKey  =GlobalKey<FormState>();
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
                          key: _formKey,
                          controller: controller,
                          cursorColor: Colors.black87,
                          validator: (value){
                            if(int.parse(value!) < 0 || int.parse(value) > 72){
                              return "Please Enter Valid Number";
                            }
                            return null;
                          },
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        if(_formKey.currentState!.validate()){
                        setState(() {
                          selectedSeat = int.parse(controller.text);
                        }); 
                        _scrollController.animateTo(200*((selectedSeat/8)-1),
                            duration: const Duration(milliseconds: 50),
                            curve: Curves.easeIn);}
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
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 1, right: 1, top: 4.5, bottom: 4.5),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.grey,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Seat(1 + index * 8, 'LOWER'),
                                            Seat(2 + index * 8, 'MIDDLE'),
                                            Seat(3 + index * 8, 'UPPER'),
                                          ],
                                        ),
                                        Container(
                                          height: 64,
                                          width: 184,
                                          // color: Colors.black,
                                          child: CustomPaint(
                                            painter: UpLinePainter(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Stack(
                                      children: [
                                        Seat(7 + index * 8, 'SIDE LOWER'),
                                        Container(
                                          height: 64,
                                          width: 62,
                                          // color: Colors.black,
                                          child: CustomPaint(
                                            painter: UpLinePainter(),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Seat(4 + index * 8, 'LOWER'),
                                            Seat(5 + index * 8, 'MIDDLE'),
                                            Seat(6 + index * 8, 'UPPER'),
                                          ],
                                        ),
                                        Container(
                                          height: 64,
                                          width: 184,
                                          // color: Colors.black,
                                          child: CustomPaint(
                                            painter: DownLinePainter(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Stack(
                                      children: [
                                        Seat(8 + index * 8, 'SIDE LOWER'),
                                        Container(
                                          height: 64,
                                          width: 62,
                                          // color: Colors.black,
                                          child: CustomPaint(
                                            painter: DownLinePainter(),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
