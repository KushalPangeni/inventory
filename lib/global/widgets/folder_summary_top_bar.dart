import 'package:flutter/material.dart';

class FolderSummaryTopBar extends StatelessWidget {
  const FolderSummaryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameQuantity('Folders','2'),
        nameQuantity('Items','5'),
        nameQuantity('Total Qty','1500 units'),
        nameQuantity('Total value','\$1,00,000'),

      ],
    );
  }

  Widget nameQuantity(String title,String quantity){
    return Column(
      children: [
        Text(title,
            style:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        Text(quantity,
            style:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
      ],
    );
  }
}
