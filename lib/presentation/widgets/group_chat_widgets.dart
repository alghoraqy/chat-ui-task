import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_textstyle.dart';
import '../../core/utils/responsive.dart';

Widget buildMessage(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: rhight(context) / 200,
              horizontal: rwidth(context) / 100),
          width: rwidth(context) / 1.55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(.2)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 100,
                vertical: rhight(context) / 200),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: rwidth(context) / 3,
                      child: Text(
                        'Mike Mazowski',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.userName
                            .copyWith(color: AppColors.orange, fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'admin',
                      style: AppTextStyle.messageBody
                          .copyWith(color: HexColor('#A1A1BC')),
                    ),
                  ],
                ),
                SizedBox(
                  height: rhight(context) / 90,
                ),
                Text(
                  'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination',
                  style: AppTextStyle.groupMessage,
                ),
                SizedBox(
                  height: rhight(context) / 150,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '16:04',
                    style: AppTextStyle.messageBody
                        .copyWith(color: HexColor('#A1A1BC'), fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: rhight(context) / 200,
        ),
        Container(
          width: rwidth(context) / 1.55,
          height: rhight(context) / 9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://d32qe1r3a676y7.cloudfront.net/eyJidWNrZXQiOiJibG9nLWVjb3RyZWUiLCJrZXkiOiAiYmxvZy8wMDAxLzAxL2FkNDZkYmI0NDdjZDBlOWE2YWVlY2Q2NGNjMmJkMzMyYjBjYmNiNzkuanBlZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6IDkwMCwiaGVpZ2h0IjowLCJmaXQiOiJjb3ZlciJ9fX0='),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: rhight(context) / 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: rwidth(context) / 3,
              height: rhight(context) / 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.immediate.co.uk/production/volatile/sites/10/2019/10/2048x1365-Trees-for-autumn-colour-GettyImages-471903735-7e8763a.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: rwidth(context) / 100,
            ),
            Container(
              width: rwidth(context) / 3.2,
              height: rhight(context) / 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://d32qe1r3a676y7.cloudfront.net/eyJidWNrZXQiOiJibG9nLWVjb3RyZWUiLCJrZXkiOiAiYmxvZy8wMDAxLzAxL2FkNDZkYmI0NDdjZDBlOWE2YWVlY2Q2NGNjMmJkMzMyYjBjYmNiNzkuanBlZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6IDkwMCwiaGVpZ2h0IjowLCJmaXQiOiJjb3ZlciJ9fX0='),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildMyMessage(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: rhight(context) / 200, horizontal: rwidth(context) / 100),
      width: rwidth(context) / 1.55,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: AppColors.main),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: rwidth(context) / 100, vertical: rhight(context) / 200),
        child: Column(
          children: [
            Text(
              'That’s very nice place! you guys made a very good decision. Can’t wait to go on vacation!',
              textAlign: TextAlign.left,
              style: AppTextStyle.groupMessage.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: rhight(context) / 150,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '16:04',
                style: AppTextStyle.messageBody
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
