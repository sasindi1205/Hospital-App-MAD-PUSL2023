import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
  }

  void addToAvailability(AvailabilityStruct value) {
    _availability.add(value);
  }

  void removeFromAvailability(AvailabilityStruct value) {
    _availability.remove(value);
  }

  void removeAtIndexFromAvailability(int index) {
    _availability.removeAt(index);
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    _availability[index] = updateFn(_availability[index]);
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    _availability.insert(index, value);
  }

  List<DateTime> _apoint = [];
  List<DateTime> get apoint => _apoint;
  set apoint(List<DateTime> value) {
    _apoint = value;
  }

  void addToApoint(DateTime value) {
    _apoint.add(value);
  }

  void removeFromApoint(DateTime value) {
    _apoint.remove(value);
  }

  void removeAtIndexFromApoint(int index) {
    _apoint.removeAt(index);
  }

  void updateApointAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    _apoint[index] = updateFn(_apoint[index]);
  }

  void insertAtIndexInApoint(int index, DateTime value) {
    _apoint.insert(index, value);
  }
}
