// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id;
  final LatLng latLng;
  final String name;
  final PlaceCategory category;
  final String? description;
  final int invst_value;

  const Place({
    required this.id,
    required this.latLng,
    required this.name,
    required this.category,
    this.description,
    this.invst_value = 0,
  }) : assert(invst_value >= 0 && invst_value <= 5);

  double get latitude => latLng.latitude;

  double get longitude => latLng.longitude;

  Place copyWith({
    String? id,
    LatLng? latLng,
    String? name,
    PlaceCategory? category,
    String? description,
    int? invst_value,
  }) {
    return Place(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      invst_value: invst_value ?? this.invst_value,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Place &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          latLng == other.latLng &&
          name == other.name &&
          category == other.category &&
          description == other.description &&
          invst_value == other.invst_value;

  @override
  int get hashCode =>
      id.hashCode ^
      latLng.hashCode ^
      name.hashCode ^
      category.hashCode ^
      description.hashCode ^
      invst_value.hashCode;
}

enum PlaceCategory {
  neutral,
  more,
  less,
}