import 'package:flutter/material.dart';
import '../../domain/models/piece.dart';

class UpcomingPiecesDisplay extends StatelessWidget {
  final List<Piece> pieces;
  final double cellSize;

  const UpcomingPiecesDisplay({
    super.key,
    required this.pieces,
    required this.cellSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cellSize * 3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final piece in pieces)
            Container(
              width: cellSize * 2.5,
              padding: EdgeInsets.all(cellSize * 0.1),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < piece.shape.length; i++)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < piece.shape[i].length; j++)
                              if (piece.shape[i][j])
                                Container(
                                  width: cellSize * 0.7,
                                  height: cellSize * 0.7,
                                  margin: EdgeInsets.all(cellSize * 0.05),
                                  decoration: BoxDecoration(
                                    color: piece.color,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Padding(
                                        padding: EdgeInsets.all(cellSize * 0.2),
                                        child: Text(
                                          piece.letters[i][j] ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: cellSize * 0.4,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                SizedBox(
                                  width: cellSize * 0.7,
                                  height: cellSize * 0.7,
                                ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
