import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ratings_client/ratings_client.dart';
import 'package:ratings_client/src/generated/google/protobuf/empty.pb.dart';
import 'package:ratings_client/src/generated/google/protobuf/timestamp.pb.dart';
import 'package:ratings_client/src/generated/ratings_features_app.pbgrpc.dart';
import 'package:ratings_client/src/generated/ratings_features_user.pbgrpc.dart';
import 'package:test/test.dart';

import 'ratings_client_test.mocks.dart';

@GenerateMocks([AppClient, UserClient])
void main() {
  final mockAppClient = MockAppClient();
  final mockUserClient = MockUserClient();
  final ratingsClient = RatingsClient.withClients(
    mockAppClient,
    mockUserClient,
  );

  test('get rating', () async {
    final snapId = 'foo';
    final token = 'bar';
    final testRating = Rating(
      snapId: snapId,
      totalVotes: Int64(105),
      ratingsBand: RatingsBand.NEUTRAL,
    );
    final mockResponse = GetRatingResponse(rating: testRating);
    final request = GetRatingRequest(snapId: snapId);
    when(mockAppClient.getRating(
      request,
      options: anyNamed('options'),
    )).thenAnswer((_) => MockResponseFuture<GetRatingResponse>(mockResponse));
    final response = await ratingsClient.getRating(
      snapId,
      token,
    );
    expect(
      response,
      equals(mockResponse),
    );
    final capturedArgs = verify(mockAppClient.getRating(
      request,
      options: captureAnyNamed('options'),
    )).captured;
    final capturedOptions = capturedArgs.single as CallOptions;
    expect(
      capturedOptions.metadata,
      containsPair(
        'authorization',
        'Bearer $token',
      ),
    );
  });

  test('register user', () async {
    final id = 'foo';
    final token = 'bar';
    final mockResponse = RegisterResponse(token: token);
    final request = RegisterRequest(id: id);
    when(mockUserClient.register(request))
        .thenAnswer((_) => MockResponseFuture<RegisterResponse>(mockResponse));
    final response = await ratingsClient.register(id);
    verify(mockUserClient.register(request)).captured;
    expect(
      response,
      equals(mockResponse),
    );
  });

  test('authenticate user', () async {
    final id = 'foo';
    final token = 'bar';
    final mockResponse = AuthenticateResponse(token: token);
    final request = AuthenticateRequest(id: id);
    when(mockUserClient.authenticate(request)).thenAnswer(
        (_) => MockResponseFuture<AuthenticateResponse>(mockResponse));
    final response = await ratingsClient.authenticate(id);
    verify(mockUserClient.authenticate(request)).captured;
    expect(
      response,
      equals(mockResponse),
    );
  });

  test('list user votes', () async {
    final snapIdFilter = 'foo';
    final token = 'bar';
    final mockVotes = <Vote>[
      Vote(
          snapId: 'foo1',
          snapRevision: 1,
          voteUp: true,
          timestamp: Timestamp.fromDateTime(DateTime.now())),
      Vote(
          snapId: 'foo2',
          snapRevision: 2,
          voteUp: false,
          timestamp: Timestamp.fromDateTime(DateTime.now())),
    ];
    final mockResponse = ListMyVotesResponse(votes: mockVotes);
    final request = ListMyVotesRequest(snapIdFilter: snapIdFilter);

    when(mockUserClient.listMyVotes(
      request,
      options: anyNamed('options'),
    )).thenAnswer((_) => MockResponseFuture<ListMyVotesResponse>(mockResponse));
    final response = await ratingsClient.listMyVotes(
      snapIdFilter,
      token,
    );
    expect(
      response,
      equals(mockResponse),
    );
    final capturedArgs = verify(mockUserClient.listMyVotes(request,
            options: captureAnyNamed('options')))
        .captured;
    final capturedOptions = capturedArgs.single as CallOptions;
    expect(
      capturedOptions.metadata,
      containsPair(
        'authorization',
        'Bearer $token',
      ),
    );
  });

  test('user votes', () async {
    final snapId = 'foo';
    final snapRevision = 1;
    final voteUp = true;
    final token = 'bar';
    final mockResponse = Empty();
    final request = VoteRequest(
      snapId: snapId,
      snapRevision: snapRevision,
      voteUp: voteUp,
    );

    when(mockUserClient.vote(
      request,
      options: anyNamed('options'),
    )).thenAnswer((_) => MockResponseFuture<Empty>(Empty()));
    final response = await ratingsClient.vote(
      snapId,
      snapRevision,
      voteUp,
      token,
    );
    expect(
      response,
      equals(mockResponse),
    );
    final capturedArgs = verify(mockUserClient.vote(
      request,
      options: captureAnyNamed('options'),
    )).captured;
    final capturedOptions = capturedArgs.single as CallOptions;
    expect(
        capturedOptions.metadata,
        containsPair(
          'authorization',
          'Bearer $token',
        ));
  });

  test('delete user', () async {
    final token = 'bar';
    final mockResponse = Empty();
    final request = Empty();

    when(mockUserClient.delete(
      request,
      options: anyNamed('options'),
    )).thenAnswer((_) => MockResponseFuture<Empty>(Empty()));
    final response = await ratingsClient.delete(token);
    expect(
      response,
      equals(mockResponse),
    );
    final capturedArgs = verify(
            mockUserClient.delete(request, options: captureAnyNamed('options')))
        .captured;
    final capturedOptions = capturedArgs.single as CallOptions;
    expect(
      capturedOptions.metadata,
      containsPair(
        'authorization',
        'Bearer $token',
      ),
    );
  });
}

class MockResponseFuture<T> extends Mock implements ResponseFuture<T> {
  final T value;

  MockResponseFuture(this.value);

  @override
  Future<S> then<S>(FutureOr<S> Function(T) onValue, {Function? onError}) =>
      Future.value(value).then(
        onValue,
        onError: onError,
      );
}
