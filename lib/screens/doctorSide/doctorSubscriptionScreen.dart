import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DoctorSubscriptionScreen extends StatefulWidget {
  static const routeName= 'doctor-subscription-screen';
  @override
  _DoctorSubscriptionScreenState createState() => _DoctorSubscriptionScreenState();
}

class _DoctorSubscriptionScreenState extends State<DoctorSubscriptionScreen> {
  //final List _source = [Colors.red, Colors.blue, Colors.white, Colors.yellow];
  final _imgUrl = [
    'https://images.pexels.com/photos/5452198/pexels-photo-5452198.jpeg',
    'https://images.pexels.com/photos/5452198/pexels-photo-5452198.jpeg',
    'https://images.pexels.com/photos/5452198/pexels-photo-5452198.jpeg',
    'https://images.pexels.com/photos/5452198/pexels-photo-5452198.jpeg',
  ];
  int _groupValue = 0;

  void handleradio(int value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Unlock Unlimited Access",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(height: 30),
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    //autoPlay: true
                  ),
                  items: _imgUrl.map((imagePath) {
                    return Builder(builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Radio(
                      value: 0,
                      groupValue: _groupValue,
                      onChanged: handleradio),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$119.99/Year",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('\$9.99/Month billed annually'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: _groupValue,
                      onChanged: handleradio),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "7 DAY FREE TRAIL",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("\$14.99/Month after 1 week"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
