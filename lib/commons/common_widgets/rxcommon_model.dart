import 'dart:io';

class RxCommonModel {
  String? image = '';
  File? fileImg;
  String? imgId = '';
  String? title = '';
  String? subtitle = '';
  String? status = '';
  String? massage = '';
  bool? check = false;

  // Categories? categories;
  // Amenities? amenities;
  // FriendData? friendData;
  // HashTagData? hashTags;

  RxCommonModel({
    this.image,
    this.fileImg,
    this.imgId,
    this.title,
    this.subtitle,
    this.check,
    this.status,
    this.massage,
    // this.categories,
    // this.hashTags,
    // this.amenities,
    // this.friendData
  });

  factory RxCommonModel.fromDocument(RxCommonModel document) {
    return RxCommonModel(
      image: document.image,
      fileImg: document.fileImg,
      imgId: document.imgId,
      title: document.title,
      subtitle: document.subtitle,
      check: document.check,
      status: document.status,
      massage: document.massage,
      // categories: document.categories,
      // amenities: document.amenities,
      // friendData: document.friendData,
    );
  }
}
