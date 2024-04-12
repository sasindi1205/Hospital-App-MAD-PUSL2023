import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? averageRatings(List<int>? ratings) {
  if (ratings == null || ratings.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int rating in ratings) {
    sum += rating;
  }
  return (sum / ratings.length).round();
}

List<AvailabilityStruct>? initialAvailability() {
  final List<AvailabilityStruct> availability = [];
  final List<String> daysOfweek = [
    'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
        'Saturday'
        'Sunday'
  ];
  for (final day in daysOfweek) {
    availability.add(
        AvailabilityStruct(dayOfWeek: day, startTime: null, endTime: null));
  }
  return null;
}
