import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../controllers/game_controller.dart';
import '../widgets/held_piece_display.dart';
import '../widgets/upcoming_pieces_display.dart';
import '../../domain/models/piece.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameControllerProvider);
    final controller = ref.read(gameControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate sizes based on available height
            final availableHeight = constraints.maxHeight;
            // Board should be 80% of available height
            final boardHeight = availableHeight * 0.8;
            // Width is half of height (maintaining 2:1 ratio)
            final boardWidth = boardHeight * 0.5;
            // Use the smaller of our calculated width or 85% of screen width
            final gameWidth = min(boardWidth, constraints.maxWidth * 0.85);
            
            return Center(
              child: Column(
                children: [
                  // Game Board
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: gameWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Hold piece and upcoming pieces
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                HeldPieceDisplay(
                                  heldPiece: gameState.board.heldPiece,
                                  cellSize: gameWidth * 0.067,
                                ),
                                SizedBox(width: gameWidth * 0.02),
                                Expanded(
                                  child: UpcomingPiecesDisplay(
                                    pieces: gameState.upcomingPieces,
                                    cellSize: gameWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Score: ${gameState.score}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: gameWidth * 0.08,
                              ),
                            ),
                            SizedBox(height: availableHeight * 0.02),
                            AspectRatio(
                              aspectRatio: 0.5, // 2:1 ratio for the board
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTapUp: (details) {
                                  final localPosition = details.localPosition;
                                  final width = gameWidth;
                                  final height = gameWidth * 2;

                                  final relX = localPosition.dx / width;
                                  final relY = localPosition.dy / height;

                                  // Check if tap is in hold piece area (top left corner)
                                  if (relX < 0.3 && relY < 0.3) {
                                    controller.holdPiece();
                                    return;
                                  }

                                  // Rest of the tap handling for rotations
                                  if (relY < 0.5) {
                                    controller.rotate(rotate180: true);
                                  } else {
                                    if (relX < 1/3) {
                                      controller.rotate(clockwise: false);
                                    } else if (relX > 2/3) {
                                      controller.rotate(clockwise: true);
                                    }
                                  }
                                },
                                onVerticalDragUpdate: (details) {
                                  if (details.delta.dy > 0) {
                                    controller.startSoftDrop();
                                  } else if (details.delta.dy < -20) {
                                    controller.hardDrop();
                                  }
                                },
                                onVerticalDragEnd: (_) => controller.endSoftDrop(),
                                onVerticalDragCancel: () => controller.endSoftDrop(),
                                onHorizontalDragUpdate: (details) {
                                  if (details.delta.dx > 2) {
                                    controller.moveRight();
                                  } else if (details.delta.dx < -2) {
                                    controller.moveLeft();
                                  }
                                },
                                child: Stack(
                                  children: [
                                    // Touch area indicators
                                    IgnorePointer(
                                      child: CustomPaint(
                                        size: Size.infinite,
                                        painter: TouchAreaPainter(),
                                      ),
                                    ),
                                    // Board grid
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: gameState.board.cols,
                                      ),
                                      itemCount: gameState.board.rows * gameState.board.cols,
                                      itemBuilder: (context, index) {
                                        final row = index ~/ gameState.board.cols;
                                        final col = index % gameState.board.cols;
                                        final cell = gameState.board.grid[row][col];

                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white24,
                                              width: 0.5,
                                            ),
                                            color: cell?.color,
                                          ),
                                          child: cell?.letter != null
                                              ? Center(
                                                  child: Text(
                                                    cell!.letter!,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: gameWidth / gameState.board.cols * 0.6,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        );
                                      },
                                    ),
                                    // Shadow piece
                                    if (gameState.board.currentPiece != null)
                                      CustomPaint(
                                        painter: PiecePainter(
                                          piece: gameState.board.getShadowPiece()!,
                                          cellSize: gameWidth / gameState.board.cols,
                                          color: Colors.white24,
                                        ),
                                      ),
                                    // Current piece
                                    if (gameState.board.currentPiece != null)
                                      CustomPaint(
                                        painter: PiecePainter(
                                          piece: gameState.board.currentPiece!,
                                          cellSize: gameWidth / gameState.board.cols,
                                          color: gameState.board.currentPiece!.color,
                                        ),
                                      ),
                                    // Game over overlay
                                    if (gameState.board.isGameOver)
                                      Container(
                                        color: Colors.black87,
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Game Over',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Text(
                                                'Score: ${gameState.score}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TouchAreaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Hold piece area (top left)
    final holdPaint = Paint()
      ..color = Colors.purple.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.3, size.height * 0.3),
      holdPaint,
    );

    // 180° rotation area (top half)
    final rotatePaint = Paint()
      ..color = Colors.yellow.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height / 2),
      rotatePaint,
    );

    // CCW rotation area (bottom left)
    final ccwPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
      Rect.fromLTWH(0, size.height / 2, size.width / 3, size.height / 2),
      ccwPaint,
    );

    // CW rotation area (bottom right)
    final cwPaint = Paint()
      ..color = Colors.green.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 2 / 3, size.height / 2, size.width / 3, size.height / 2),
      cwPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PiecePainter extends CustomPainter {
  final Piece piece;
  final double cellSize;
  final Color color;

  PiecePainter({
    required this.piece,
    required this.cellSize,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    for (var row = 0; row < piece.shape.length; row++) {
      for (var col = 0; col < piece.shape[row].length; col++) {
        if (piece.shape[row][col]) {
          final rect = Rect.fromLTWH(
            (piece.x + col) * cellSize,
            (piece.y + row) * cellSize,
            cellSize,
            cellSize,
          );
          canvas.drawRect(rect, paint);

          // Draw letter if present
          if (piece.letters[row][col] != null) {
            textPainter.text = TextSpan(
              text: piece.letters[row][col],
              style: TextStyle(
                color: Colors.white,
                fontSize: cellSize * 0.6,
                fontWeight: FontWeight.bold,
              ),
            );
            textPainter.layout(
              minWidth: 0,
              maxWidth: cellSize,
            );
            textPainter.paint(
              canvas,
              Offset(
                (piece.x + col) * cellSize + (cellSize - textPainter.width) / 2,
                (piece.y + row) * cellSize + (cellSize - textPainter.height) / 2,
              ),
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
