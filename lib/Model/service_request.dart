// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ServiceRequest {
  final String id;
  final String? feedback;
  final String? videoURL;
  final String? description;
  final String userID;
  final String state;
  final String address;
  final DateTime dateTime;
  final DateTime bookedDateTime;
  final double price;
  final int? rate;
  final int typeHome;
  final int prefer;
  final int status;
  Map<String?, double?>? cleaners;
  List<String?>? pic;

  ServiceRequest({
    this.feedback,
    this.videoURL,
    this.description,
    this.cleaners,
    this.pic,
    this.rate,
    required this.id,
    required this.userID,
    required this.state,
    required this.address,
    required this.dateTime,
    required this.bookedDateTime,
    required this.price,
    required this.typeHome,
    required this.prefer,
    required this.status,
  });

  ServiceRequest copyWith({
    String? id,
    String? feedback,
    String? videoURL,
    String? description,
    String? userID,
    String? state,
    String? address,
    DateTime? dateTime,
    DateTime? bookedDateTime,
    double? price,
    int? rate,
    int? typeHome,
    int? prefer,
    int? status,
    Map<String?, double?>? cleaners,
    List<String?>? pic,
  }) {
    return ServiceRequest(
      id: id ?? this.id,
      feedback: feedback ?? this.feedback,
      videoURL: videoURL ?? this.videoURL,
      description: description ?? this.description,
      userID: userID ?? this.userID,
      state: state ?? this.state,
      address: address ?? this.address,
      dateTime: dateTime ?? this.dateTime,
      bookedDateTime: bookedDateTime ?? this.bookedDateTime,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      typeHome: typeHome ?? this.typeHome,
      prefer: prefer ?? this.prefer,
      status: status ?? this.status,
      cleaners: cleaners ?? this.cleaners,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'feedback': feedback,
      'videoURL': videoURL,
      'description': description,
      'userID': userID,
      'state': state,
      'address': address,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'bookedDateTime': bookedDateTime.millisecondsSinceEpoch,
      'price': price,
      'rate': rate,
      'typeHome': typeHome,
      'prefer': prefer,
      'status': status,
      'cleaners': cleaners,
      'pic': pic,
    };
  }

  factory ServiceRequest.fromMap(Map<String, dynamic> map) {
    return ServiceRequest(
      id: map['id'] as String,
      feedback: map['feedback'] != null ? map['feedback'] as String : null,
      videoURL: map['videoURL'] != null ? map['videoURL'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      userID: map['userID'] as String,
      state: map['state'] as String,
      address: map['address'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      bookedDateTime: DateTime.fromMillisecondsSinceEpoch(map['bookedDateTime'] as int),
      price: map['price'] as double,
      rate: map['rate'] != null ? map['rate'] as int : null,
      typeHome: map['typeHome'] as int,
      prefer: map['prefer'] as int,
      status: map['status'] as int,
      cleaners: Map<String?, double?>.from((map['cleaners'] as Map<String?, double?>)),
      pic: List<String?>.from((map['pic'] as List<String?>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceRequest.fromJson(String source) => ServiceRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceRequest(id: $id, feedback: $feedback, videoURL: $videoURL, description: $description, userID: $userID, state: $state, address: $address, dateTime: $dateTime, bookedDateTime: $bookedDateTime, price: $price, rate: $rate, typeHome: $typeHome, prefer: $prefer, status: $status, cleaners: $cleaners, pic: $pic)';
  }

  @override
  bool operator ==(covariant ServiceRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.feedback == feedback &&
        other.videoURL == videoURL &&
        other.description == description &&
        other.userID == userID &&
        other.state == state &&
        other.address == address &&
        other.dateTime == dateTime &&
        other.bookedDateTime == bookedDateTime &&
        other.price == price &&
        other.rate == rate &&
        other.typeHome == typeHome &&
        other.prefer == prefer &&
        other.status == status &&
        mapEquals(other.cleaners, cleaners) &&
        listEquals(other.pic, pic);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        feedback.hashCode ^
        videoURL.hashCode ^
        description.hashCode ^
        userID.hashCode ^
        state.hashCode ^
        address.hashCode ^
        dateTime.hashCode ^
        bookedDateTime.hashCode ^
        price.hashCode ^
        rate.hashCode ^
        typeHome.hashCode ^
        prefer.hashCode ^
        status.hashCode ^
        cleaners.hashCode ^
        pic.hashCode;
  }
}
