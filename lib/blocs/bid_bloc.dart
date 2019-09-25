import 'dart:async';

import 'package:wastexchange_mobile/models/buyer_bid_confirmation_data.dart';
import 'package:wastexchange_mobile/models/result.dart';
import 'package:wastexchange_mobile/resources/bid_repository.dart';

class BidBloc {
  final BidRepository _bidRepository = BidRepository();
  final StreamController _buyerController = StreamController<Result<String>>();

  StreamSink<Result<String>> get bidSink => _buyerController.sink;
  Stream<Result<String>> get bidStream => _buyerController.stream;

  Future<void> placeBid(int previousBidId, BuyerBidData data) async {
    bidSink.add(Result.loading('Loading'));
    Result<String> response;
    if(previousBidId != null) {
      response = await _bidRepository.updateBid(previousBidId, data);
    } else {
      response = await _bidRepository.placeBid(data);
    }
    bidSink.add(response);
  }

  void dispose() {
    _buyerController.close();
  }
}
