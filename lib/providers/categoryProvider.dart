// packages
import 'package:flutter/foundation.dart';

//
import '../models/catergoryModel.dart';

class CategoryProvider with ChangeNotifier{
  List<CategoryModel> _categories = [
    CategoryModel(
      id: '1a',
      title: 'Find & Book Doctor',
      image: 'assets/images/internists.jpg',
    ),
    CategoryModel(
      id: '2a',
      title: 'Diagnostic & Lab Tests',
      image: 'assets/images/lab.jpg',
    ),
    CategoryModel(
      id: '3a',
      title: 'Appointment Video Consult',
      image: 'assets/images/clinical genetics.jpg',
    ),
    CategoryModel(
      id: '4a',
      title: 'Find & Book Doctor',
      image: 'assets/images/doctor.png',
    ),
  ];

  List<CategoryModel> get categories{
    return [..._categories];
  }

}