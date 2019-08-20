import 'package:flutter/material.dart';
import 'package:wastexchange_mobile/models/item.dart';
import 'package:wastexchange_mobile/util/app_colors.dart';
import 'package:wastexchange_mobile/util/constants.dart';

class SellerItemCell extends StatelessWidget {
  const SellerItemCell(this.item);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        child: ListTile(
            title: Text(
              item.name,
              style: const TextStyle(fontSize: 16.0, color: AppColors.text_black),
            ),
            subtitle: RichText(
              text: TextSpan(
                  style:
                  TextStyle(fontSize: 14.0, color: AppColors.text_grey),
                  children: [
                    TextSpan(
                        text: '${item.qty.toString()}'),
                    const TextSpan(text: ' kg(s)'),
                  ]),
            ),
            trailing: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 14.0, color: AppColors.text_grey),
                  children: [
                    TextSpan(
                      text: '${Constants.INR_UNICODE} ',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.text_black,
                      ),
                    ),
                    TextSpan(
                        text: item.price.toString(),
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: AppColors.text_black)),
                    const TextSpan(
                        text: '/kg',
                        style: TextStyle(color: AppColors.text_black)),
                  ]),
            ))
        );
  }
}