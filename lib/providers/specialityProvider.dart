import 'package:flutter/material.dart';
import 'package:oladoc/models/specialityModel.dart';

class SpecialityProvider with ChangeNotifier {
  List<SpecialityModel> _specialities = [
    SpecialityModel(
      id: 's1',
      image: 'assets/images/skin specialist.jpg',
      title: 'Skin Specialist',
    ),
    SpecialityModel(
      id: 's2',
      image: 'assets/images/urologist.jpg',
      title: 'Urologist',
    ),
    SpecialityModel(
      id: 's3',
      image: 'assets/images/Child Specialist.jpg',
      title: 'Child Specialist',
    ),
    SpecialityModel(
      id: 's4',
      image: 'assets/images/consultant physicians.jpg',
      title: 'Consultant Physician',
    ),
    SpecialityModel(
      id: 's5',
      image: 'assets/images/gynecologist.jpg',
      title: 'Gynecologist',
    ),
    SpecialityModel(
      id: 's6',
      image: 'assets/images/orthopedic surgeon.jpg',
      title: 'Orthopadic / Surgeon',
    ),
    SpecialityModel(
      id: 's7',
      image: 'assets/images/general_physician.jpg',
      title: 'General Physician',
    ),
    SpecialityModel(
      id: 's8',
      image: 'assets/images/ent_specialist.jpg',
      title: 'ENT Specialist',
    ),
    SpecialityModel(
      id: 's9',
      image: 'assets/images/neurologist.jpg',
      title: 'Neurologist',
    ),
    SpecialityModel(
      id: 's10',
      image: 'assets/images/default.jpg',
      title: 'Eye Specialist',
    ),
    SpecialityModel(
      id: 's11',
      image: 'assets/images/psychiatrist.jpg',
      title: 'Psychiatrist',
    ),
    SpecialityModel(
      id: 's12',
      image: 'assets/images/Dentist.jpg',
      title: 'Dentist',
    ),
    SpecialityModel(
      id: 's13',
      image: 'assets/images/gastroenterologist.jpg',
      title: 'Gastroenterologist',
    ),
    SpecialityModel(
      id: 's14',
      image: 'assets/images/heart specialist.jpg',
      title: 'Heart Specialist',
    ),
    SpecialityModel(
      id: 's15',
      image: 'assets/images/pulmonologist.jpg',
      title: 'Pulmonologist',
    ),
    SpecialityModel(
      id: 's16',
      image: 'assets/images/consultant physicians.jpg',
      title: 'Consultant Physician',
    ),
    SpecialityModel(
      id: 's17',
      image: 'assets/images/Diabetes_Specialist.jpg',
      title: 'Diabetes Specialist',
    ),
    SpecialityModel(
      id: 's18',
      image: 'assets/images/General_Surgeon.jpg',
      title: 'General Surgeon',
    ),
    SpecialityModel(
      id: 's19',
      image: 'assets/images/Endocrinologist.jpg',
      title: 'Endocrinologist',
    ),
    SpecialityModel(
      id: 's20',
      image: 'assets/images/kidney specialiest.jpg',
      title: 'Kidney Specialist',
    ),
    SpecialityModel(
      id: 's21',
      image: 'assets/images/pain management.jpg',
      title: 'Pain Specialist',
    ),
    SpecialityModel(
      id: 's22',
      image: 'assets/images/Ultrasound_Specialist.jpg',
      title: 'Ultrasound Specialist',
    ),
    SpecialityModel(
      id: 's23',
      image: 'assets/images/x_ray_specialist.jpg',
      title: 'X-ray Specialist',
    ),
    SpecialityModel(
      id: 's24',
      image: 'assets/images/Family_physicin.jpg',
      title: 'Family Physician',
    ),
    SpecialityModel(
      id: 's25',
      image: 'assets/images/internists.jpg',
      title: 'Internists',
    ),
    SpecialityModel(
      id: 's26',
      image: 'assets/images/pediatricians.jpg',
      title: 'Pediatricians',
    ),
    SpecialityModel(
      id: 's27',
      image: 'assets/images/Anesthesiologists.jpg',
      title: 'Anesthesiologists',
    ),
    SpecialityModel(
      id: 's28',
      image: 'assets/images/pathologists.png',
      title: 'Pathologist',
    ),
    SpecialityModel(
      id: 's29',
      image: 'assets/images/allergists_and_immunologist.jpg',
      title: 'Allegists',
    ),
    SpecialityModel(
      id: 's30',
      image: 'assets/images/Nuclear medicine physician.jpeg',
      title: 'Nuclear Medicine Physicians',
    ),
    SpecialityModel(
      id: 's31',
      image: 'assets/images/orthopedic surgeon.jpg',
      title: 'Ophthalmologists',
    ),
    SpecialityModel(
      id: 's32',
      image: 'assets/images/Rehabilitation_Physicians.png',
      title: 'Rehabilitation Physicians',
    ),
    SpecialityModel(
      id: 's33',
      image: 'assets/images/preventive_medicine_physicians.jpg',
      title: 'Preventive Medicine Physicians',
    ),
    SpecialityModel(
      id: 's34',
      image: 'assets/images/Radiologists.jpg',
      title: 'Radiologists',
    ),
    SpecialityModel(
      id: 's35',
      image: 'assets/images/Sports_medicine_physicians.jpeg',
      title: 'Sports Medicine Physicians',
    ),
    SpecialityModel(
      id: 's36',
      image: 'assets/images/default.jpg',
      title: 'Podiatrists',
    ),
    SpecialityModel(
      id: 's37',
      image: 'assets/images/Nutritionist.jpg',
      title: 'Nutrionists',
    ),
    SpecialityModel(
      id: 's38',
      image: 'assets/images/Cardiovascular Thoracic Surgeon.jpg',
      title: 'Cardiorascular/\nThoracic surgery',
    ),
    SpecialityModel(
      id: 's39',
      image: 'assets/images/clinical genetics.jpg',
      title: 'Clinical Genetics',
    ),
    SpecialityModel(
      id: 's40',
      image: 'assets/images/FPRHealth.png',
      title: 'Family planning and reproductive health',
    ),
    SpecialityModel(
      id: 's41',
      image: 'assets/images/plastic_and_reconstructive_surgeon.jpg',
      title: 'Plastic and reconstructive surgeon',
    ),
    SpecialityModel(
      id: 's42',
      image: 'assets/images/sexologiest.png',
      title: 'Sexologist',
    ),
    SpecialityModel(
      id: 's43',
      image: 'assets/images/sport_specialist.jpg',
      title: 'Sports Specialist',
    ),
    SpecialityModel(
      id: 's44',
      image: 'assets/images/Dietitians.jpg',
      title: 'Dietitians',
    ),
  ];

  List<SpecialityModel> get specialities {
    return [..._specialities];
  }

 // SpecialityModel findbyId(String id){
 //    return _specialities.firstWhere((spec) => spec.id==id);
 // }
}
