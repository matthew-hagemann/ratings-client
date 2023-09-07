import 'package:meta/meta.dart';

import 'generated/ratings_features_user.pb.dart' as pb;

@immutable
class Vote {
  final String snapId;
  final int snapRevision;
  final bool voteUp;
  final DateTime dateTime;

  Vote({
    required this.snapId,
    required this.snapRevision,
    required this.voteUp,
    required this.dateTime,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vote &&
        other.snapId == snapId &&
        other.snapRevision == snapRevision &&
        other.voteUp == voteUp &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode =>
      snapId.hashCode ^
      snapRevision.hashCode ^
      voteUp.hashCode ^
      dateTime.hashCode;
}

extension VoteFromDTO on pb.Vote {
  Vote fromDTO() {
    return Vote(
      snapId: this.snapId,
      snapRevision: this.snapRevision,
      voteUp: this.voteUp,
      dateTime: this.timestamp.toDateTime(),
    );
  }
}
