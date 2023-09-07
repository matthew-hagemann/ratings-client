import 'package:meta/meta.dart';

import 'generated/ratings_features_app.pb.dart' as pb;

@immutable
class Rating {
  final String snapId;
  final int totalVotes;
  final RatingsBand ratingsBand;

  Rating({
    required this.snapId,
    required this.totalVotes,
    required this.ratingsBand,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rating &&
        other.snapId == snapId &&
        other.totalVotes == totalVotes &&
        other.ratingsBand == ratingsBand;
  }

  @override
  int get hashCode =>
      snapId.hashCode ^ totalVotes.hashCode ^ ratingsBand.hashCode;
}

enum RatingsBand {
  veryGood,
  good,
  neutral,
  poor,
  veryPoor,
  insufficientVotes,
}

extension RatingFromDTO on pb.Rating {
  Rating fromDTO() {
    return Rating(
      snapId: this.snapId,
      totalVotes: this.totalVotes.toInt(),
      ratingsBand: this.ratingsBand.fromDTO(),
    );
  }
}

extension RatingsBandFromDTO on pb.RatingsBand {
  RatingsBand fromDTO() {
    switch (this) {
      case pb.RatingsBand.VERY_GOOD:
        return RatingsBand.veryGood;
      case pb.RatingsBand.GOOD:
        return RatingsBand.good;
      case pb.RatingsBand.NEUTRAL:
        return RatingsBand.neutral;
      case pb.RatingsBand.POOR:
        return RatingsBand.poor;
      case pb.RatingsBand.VERY_POOR:
        return RatingsBand.veryPoor;
      case pb.RatingsBand.INSUFFICIENT_VOTES:
        return RatingsBand.insufficientVotes;
      default:
        return RatingsBand.insufficientVotes;
    }
  }
}
