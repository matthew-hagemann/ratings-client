import 'package:grpc/grpc.dart';
import 'package:ratings_client/src/generated/ratings_features_app.pbgrpc.dart';
import 'package:ratings_client/src/generated/ratings_features_user.pbgrpc.dart';
import 'src/generated/google/protobuf/empty.pb.dart';
import 'dart:async';
import 'package:async/async.dart';

class RatingsClient {
  late AppClient _appClient;
  late UserClient _userClient;

  RatingsClient(String serverUrl, int port) {
    final channel = ClientChannel(
      serverUrl,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _appClient = AppClient(channel);
    _userClient = UserClient(channel);
  }

  // Additional constructor for testing
  RatingsClient.withClients(this._appClient, this._userClient);

  Future<Result<GetRatingResponse>> getRating(
      String snapId, String token) async {
    try {
      final request = GetRatingRequest(snapId: snapId);
      final callOptions =
          CallOptions(metadata: {'authorization': 'Bearer $token'});
      final response =
          await _appClient.getRating(request, options: callOptions);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<RegisterResponse>> register(String id) async {
    try {
      final request = RegisterRequest(id: id);
      final response = await _userClient.register(request);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<AuthenticateResponse>> authenticate(String id) async {
    try {
      final request = AuthenticateRequest(id: id);
      final response = await _userClient.authenticate(request);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<ListMyVotesResponse>> listMyVotes(
      String snapIdFilter, String token) async {
    try {
      final request = ListMyVotesRequest(snapIdFilter: snapIdFilter);
      final callOptions =
          CallOptions(metadata: {'authorization': 'Bearer $token'});
      final response =
          await _userClient.listMyVotes(request, options: callOptions);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<Empty>> vote(
      String snapId, int snapRevision, bool voteUp, String token) async {
    try {
      final request = VoteRequest(
        snapId: snapId,
        snapRevision: snapRevision,
        voteUp: voteUp,
      );
      final callOptions =
          CallOptions(metadata: {'authorization': 'Bearer $token'});
      final response = await _userClient.vote(request, options: callOptions);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<Empty>> delete(String token) async {
    try {
      final request = Empty();
      final callOptions =
          CallOptions(metadata: {'authorization': 'Bearer $token'});
      final response = await _userClient.delete(request, options: callOptions);
      return Result.value(response);
    } catch (e) {
      return Result.error(e);
    }
  }
}
