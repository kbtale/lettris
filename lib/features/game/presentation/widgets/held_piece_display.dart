import 'package:flutter/material.dart';
import '../../domain/models/piece.dart';

class HeldPieceDisplay extends StatelessWidget {
  final Piece? heldPiece;
  final double cellSize;

  const HeldPieceDisplay({
    super.key,
    required this.heldPiece,
    this.cellSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellSize * 4,
      height: cellSize * 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: heldPiece != null
          ? Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: EdgeInsets.all(cellSize * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < heldPiece!.shape.length; i++)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < heldPiece!.shape[i].length; j++)
                              if (heldPiece!.shape[i][j])
                                Container(
                                  width: cellSize,
                                  height: cellSize,
                                  margin: EdgeInsets.all(cellSize * 0.05),
                                  decoration: BoxDecoration(
                                    color: heldPiece!.color,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Padding(
                                        padding: EdgeInsets.all(cellSize * 0.2),
                                        child: Text(
                                          heldPiece!.letters[i][j] ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: cellSize * 0.6,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                SizedBox(width: cellSize, height: cellSize),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
