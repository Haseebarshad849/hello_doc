import 'package:flutter/material.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  static const routeName = 'doctor-appointment-screen';
  bool isAppointment=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(0, 0, 96, 1),
        title: Text(
          "Appointments",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: isAppointment? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              child: Image.network(
                  'https://5.imimg.com/data5/JC/GX/MY-49925568/appointment-booking-500x500.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You have no upcomming appointments",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ):Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 17, left: 13),
            color: Colors.white,
            height: 55,
            width: double.infinity,
            child: Text(
              "Upcoming",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      "20 May",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.grey,
                  //   radius: 50,
                  // )
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr Rabia Ishfaq",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Thursday 6:30 PM",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hameedah Memorial Hospital",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Fee 1500",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reshedule"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white),
                          onPressed: () {},
                          child: Text(
                            "More Options",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
