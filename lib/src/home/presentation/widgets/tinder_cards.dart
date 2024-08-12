import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/home/presentation/widgets/tinder_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class TinderCards extends StatefulWidget {
  const TinderCards({super.key});

  @override
  State<TinderCards> createState() => _TinderCardsState();
}

class _TinderCardsState extends State<TinderCards>
    with TickerProviderStateMixin {
  final CardController cardController = CardController();

  int totalCards = 10;
  @override
  Widget build(BuildContext context) {
    final cw = context.width;

    return Center(
      child: SizedBox(
        height: cw,
        width: cw,
        child: TinderSwapCard(
          totalNum: totalCards,
          cardController: cardController,
          swipeEdge: 4,
          maxWidth: cw,
          maxHeight: cw * .9,
          minWidth: cw * .71,
          minHeight: cw * .85,
          allowSwipe: false,
          swipeUpdateCallback:
              (DragUpdateDetails details, Alignment alignments) {
            if (alignments.x < 0) {
            } else if (alignments.x > 0) {}
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            if (index == totalCards - 1) {
              setState(() {
                totalCards += 10;
              });
            }
          },
          cardBuilder: (context, index) {
            final isFirst = index == 0;
            final colorByIndex =
                index == 1 ? Color(0xFFDA92FC) : Color(0xFFDC95FB);
            return Stack(
//              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 110,
                  right: 0,
                  left: 0,
                  child: TinderCard(
                    isFirst: isFirst,
                    colour: isFirst ? null : colorByIndex,
                  ),
                ),
                if (isFirst)
                  Positioned(
                    bottom: 130,
                    right: 20,
                    child: Image.asset(
                      MediaRes.microscope,
                      height: 180,
                      width: 149,
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
