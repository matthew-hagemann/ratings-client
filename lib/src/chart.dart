import 'package:freezed_annotation/freezed_annotation.dart';

import 'generated/ratings_features_chart.pb.dart' as pb;

part 'chart.freezed.dart';

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    required String app,
    required int totalUpVotes,
    required int totalDownVotes,
    required double rating,
    required RatingsBand ratingsBand,
  }) = _ChartData;
}

enum RatingsBand {
  veryGood,
  good,
  neutral,
  poor,
  veryPoor,
  insufficientVotes,
}

enum Timeframe {
  unspecified,
  week,
  month,
}

extension ChartDataFromDTO on pb.ChartData {
  ChartData fromDTO() {
    return ChartData(
      app: this.app,
      totalUpVotes: this.totalUpVotes.toInt(),
      totalDownVotes: this.totalDownVotes.toInt(),
      rating: this.rating,
      ratingsBand: this.ratingsBand.fromDTO(),
    );
  }
}

extension RatingsBandFromDTO on pb.RatingsBand {
  RatingsBand fromDTO() {
    return switch (this) {
      pb.RatingsBand.VERY_GOOD => RatingsBand.veryGood,
      pb.RatingsBand.GOOD => RatingsBand.good,
      pb.RatingsBand.NEUTRAL => RatingsBand.neutral,
      pb.RatingsBand.POOR => RatingsBand.poor,
      pb.RatingsBand.VERY_POOR => RatingsBand.veryPoor,
      _ => RatingsBand.insufficientVotes,
    };
  }
}

extension TimeframeFromDTO on pb.Timeframe {
  Timeframe fromDTO() {
    return switch (this) {
      pb.Timeframe.TIMEFRAME_UNSPECIFIED => Timeframe.unspecified,
      pb.Timeframe.TIMEFRAME_WEEK => Timeframe.week,
      pb.Timeframe.TIMEFRAME_MONTH => Timeframe.month,
      _ => Timeframe.unspecified,
    };
  }
}

extension TimeframeToDTO on Timeframe {
  pb.Timeframe toDTO() {
    return switch (this) {
      Timeframe.unspecified => pb.Timeframe.TIMEFRAME_UNSPECIFIED,
      Timeframe.week => pb.Timeframe.TIMEFRAME_WEEK,
      Timeframe.month => pb.Timeframe.TIMEFRAME_MONTH,
    };
  }
}
