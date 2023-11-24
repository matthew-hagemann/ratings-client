//
//  Generated code. Do not modify.
//  source: ratings_features_chart.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use timeframeDescriptor instead')
const Timeframe$json = {
  '1': 'Timeframe',
  '2': [
    {'1': 'TIMEFRAME_UNSPECIFIED', '2': 0},
    {'1': 'TIMEFRAME_WEEK', '2': 1},
    {'1': 'TIMEFRAME_MONTH', '2': 2},
  ],
};

/// Descriptor for `Timeframe`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List timeframeDescriptor = $convert.base64Decode(
    'CglUaW1lZnJhbWUSGQoVVElNRUZSQU1FX1VOU1BFQ0lGSUVEEAASEgoOVElNRUZSQU1FX1dFRU'
    'sQARITCg9USU1FRlJBTUVfTU9OVEgQAg==');

@$core.Deprecated('Use ratingsBandDescriptor instead')
const RatingsBand$json = {
  '1': 'RatingsBand',
  '2': [
    {'1': 'VERY_GOOD', '2': 0},
    {'1': 'GOOD', '2': 1},
    {'1': 'NEUTRAL', '2': 2},
    {'1': 'POOR', '2': 3},
    {'1': 'VERY_POOR', '2': 4},
    {'1': 'INSUFFICIENT_VOTES', '2': 5},
  ],
};

/// Descriptor for `RatingsBand`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ratingsBandDescriptor = $convert.base64Decode(
    'CgtSYXRpbmdzQmFuZBINCglWRVJZX0dPT0QQABIICgRHT09EEAESCwoHTkVVVFJBTBACEggKBF'
    'BPT1IQAxINCglWRVJZX1BPT1IQBBIWChJJTlNVRkZJQ0lFTlRfVk9URVMQBQ==');

@$core.Deprecated('Use getChartRequestDescriptor instead')
const GetChartRequest$json = {
  '1': 'GetChartRequest',
  '2': [
    {
      '1': 'timeframe',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ratings.features.chart.Timeframe',
      '10': 'timeframe'
    },
  ],
};

/// Descriptor for `GetChartRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChartRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRDaGFydFJlcXVlc3QSPwoJdGltZWZyYW1lGAEgASgOMiEucmF0aW5ncy5mZWF0dXJlcy'
    '5jaGFydC5UaW1lZnJhbWVSCXRpbWVmcmFtZQ==');

@$core.Deprecated('Use getChartResponseDescriptor instead')
const GetChartResponse$json = {
  '1': 'GetChartResponse',
  '2': [
    {
      '1': 'timeframe',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ratings.features.chart.Timeframe',
      '10': 'timeframe'
    },
    {
      '1': 'ordered_chart_data',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ratings.features.chart.ChartData',
      '10': 'orderedChartData'
    },
  ],
};

/// Descriptor for `GetChartResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChartResponseDescriptor = $convert.base64Decode(
    'ChBHZXRDaGFydFJlc3BvbnNlEj8KCXRpbWVmcmFtZRgBIAEoDjIhLnJhdGluZ3MuZmVhdHVyZX'
    'MuY2hhcnQuVGltZWZyYW1lUgl0aW1lZnJhbWUSTwoSb3JkZXJlZF9jaGFydF9kYXRhGAIgAygL'
    'MiEucmF0aW5ncy5mZWF0dXJlcy5jaGFydC5DaGFydERhdGFSEG9yZGVyZWRDaGFydERhdGE=');

@$core.Deprecated('Use chartDataDescriptor instead')
const ChartData$json = {
  '1': 'ChartData',
  '2': [
    {'1': 'app', '3': 1, '4': 1, '5': 9, '10': 'app'},
    {'1': 'total_up_votes', '3': 2, '4': 1, '5': 4, '10': 'totalUpVotes'},
    {'1': 'total_down_votes', '3': 3, '4': 1, '5': 4, '10': 'totalDownVotes'},
    {'1': 'rating', '3': 4, '4': 1, '5': 2, '10': 'rating'},
    {
      '1': 'ratings_band',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.ratings.features.chart.RatingsBand',
      '10': 'ratingsBand'
    },
  ],
};

/// Descriptor for `ChartData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chartDataDescriptor = $convert.base64Decode(
    'CglDaGFydERhdGESEAoDYXBwGAEgASgJUgNhcHASJAoOdG90YWxfdXBfdm90ZXMYAiABKARSDH'
    'RvdGFsVXBWb3RlcxIoChB0b3RhbF9kb3duX3ZvdGVzGAMgASgEUg50b3RhbERvd25Wb3RlcxIW'
    'CgZyYXRpbmcYBCABKAJSBnJhdGluZxJGCgxyYXRpbmdzX2JhbmQYBSABKA4yIy5yYXRpbmdzLm'
    'ZlYXR1cmVzLmNoYXJ0LlJhdGluZ3NCYW5kUgtyYXRpbmdzQmFuZA==');
