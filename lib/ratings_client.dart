import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';

import 'src/generated/google/protobuf/empty.pb.dart';
import 'src/generated/ratings_features_app.pbgrpc.dart';
import 'src/generated/ratings_features_user.pbgrpc.dart';

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
  @visibleForTesting
  RatingsClient.withClients(
    this._appClient,
    this._userClient,
  );

  Future<GetRatingResponse> getRating(
    String snapId,
    String token,
  ) async {
    final request = GetRatingRequest(snapId: snapId);
    final callOptions =
        CallOptions(metadata: {'authorization': 'Bearer $token'});
    return await _appClient.getRating(
      request,
      options: callOptions,
    );
  }

  Future<RegisterResponse> register(String id) async {
    final request = RegisterRequest(id: id);
    return await _userClient.register(request);
  }

  Future<AuthenticateResponse> authenticate(String id) async {
    final request = AuthenticateRequest(id: id);
    return await _userClient.authenticate(request);
  }

  Future<ListMyVotesResponse> listMyVotes(
      String snapIdFilter, String token) async {
    final request = ListMyVotesRequest(snapIdFilter: snapIdFilter);
    final callOptions =
        CallOptions(metadata: {'authorization': 'Bearer $token'});
    return await _userClient.listMyVotes(
      request,
      options: callOptions,
    );
  }

  Future<Empty> vote(
      String snapId, int snapRevision, bool voteUp, String token) async {
    final request = VoteRequest(
      snapId: snapId,
      snapRevision: snapRevision,
      voteUp: voteUp,
    );
    final callOptions =
        CallOptions(metadata: {'authorization': 'Bearer $token'});
    return await _userClient.vote(request, options: callOptions);
  }

  Future<Empty> delete(String token) async {
    final request = Empty();
    final callOptions =
        CallOptions(metadata: {'authorization': 'Bearer $token'});
    return await _userClient.delete(request, options: callOptions);
  }
}
