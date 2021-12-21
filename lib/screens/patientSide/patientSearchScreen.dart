import 'package:flutter/material.dart';
import 'package:oladoc/providers/specialityProvider.dart';
import 'package:oladoc/widgets/specialityGridBuilder.dart';
import 'package:provider/provider.dart';

class PatientSearchScreen extends StatefulWidget {
  static const routeName= 'patient-search-screen';

  @override
  _PatientSearchScreenState createState() => _PatientSearchScreenState();
}

class _PatientSearchScreenState extends State<PatientSearchScreen> {
  var speciality;
  var listForDisplay;
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  void didChangeDependencies() {
    speciality= Provider.of<SpecialityProvider>(context);
    listForDisplay = Provider.of<SpecialityProvider>(context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search by speciality'),
          // backgroundColor: Color.fromRGBO(0, 0, 96, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:8.0, vertical: 12),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Search by category'),
                  onChanged: (text){
                    text = text.toLowerCase();
          setState(() {
          listForDisplay = speciality.specialities.where((data) {
            var titleN =data.title.toLowerCase();
            return titleN.contains(text.toLowerCase());
          }).toList();
          });
                  },
                ),
                SpecialityGrid(itemCount: speciality.specialities.length,
                ),
              ],
            ),
          ),
          ),
      ),
    );
  }
}