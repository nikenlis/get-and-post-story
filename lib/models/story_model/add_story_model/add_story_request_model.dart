// import 'dart:io';

// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';

// class AddStoryRequestodel {
//   final String description;
//   final File photo;
//   final double? lat;
//   final double? lon;

//   AddStoryRequestodel({
//     required this.description,
//     required this.photo,
//     this.lat,
//     this.lon,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'description': description,
//       'lat': lat,
//       'lon': lon,
//     };
//   }

//   Map<String, dynamic> toFormData() {
//     return {
//       'description': description,
//       'photo': MultipartFile.fromFileSync(photo.path),
//       'lat': lat,
//       'lon': lon,
//     };
//   }
// }
