#include "gba.h"
#include "print.h"
#include "text.h"

// prototypes
void initialize();
void update();

void drawMenu();
void drawPause();
void drawWin();
void drawLose();
void drawLine();
void drawBall();
void drawPlayer();
void drawHeart();

void updateBall();
void splitSquare();
void loseLife();

void goToMenu();
void goToIdle();
void goToPause();
void goToWin();
void goToLose();

int time;
int timestep = 20;
int frame;
int area, lives;
int lineDirection, originX, originY, lineX, lineY, lineTime;
int lifeLost;

enum STATE { MENU, IDLE, PAUSE, LINE, WIN, LOSE } state;

unsigned short bgColor;
unsigned short playerColor;
unsigned short ballColor;

unsigned short oldButtons;
unsigned short buttons;

int playerX, playerY, playerOldX, playerOldY, playerLength;
int ballX, ballY, ballOldX, ballOldY, ballLength, ballVelocityX, ballVelocityY;
int boxX, boxY, boxOldX, boxOldY, boxWidth, boxHeight, boxOldWidth, boxOldHeight;

int main() {
    mgba_open();
    mgba_printf("Debug log initialized!");
    
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case MENU:
                waitForVBlank();
                drawMenu();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    drawRect(60, 75, 6 * 20, 9, PINK);
                    goToIdle();
                }
                break;
            case IDLE:
                update();
                waitForVBlank();

                lifeLost = 0;
                mgba_printf("%d   %d   %d", boxHeight, boxWidth, area);
                if (area < 625) {
                    goToWin();
                }

                if (lives == 0) {
                    goToLose();
                }

                if (time % 2 == 0) {
                    drawPlayer();
                }

                if (time % 3 == 0) {
                    updateBall();
                    drawBall(frame);
                }

                if (time % timestep == 0) {
                    drawBall(frame);
                    if (frame + 1 == 2) {
                        frame = 0;
                    } else {
                        frame++;
                    }
                    time = 0;
                }
                time++;

                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToPause();
                }

                if (BUTTON_PRESSED(BUTTON_DOWN)) {
                    if (playerX > boxX && playerX < (boxX + boxWidth) && playerY == boxY) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 0;
                    }
                }

                if (BUTTON_PRESSED(BUTTON_LEFT)) {
                    //mgba_printf("%d  %d  %d  %d  %d", playerY, boxY, (boxY + boxHeight), playerX, (boxX + boxWidth));
                    if (playerY > boxY && playerY < (boxY + boxHeight - 1) && playerX == boxX + boxWidth - 1) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 1;
                    }
                }

                if (BUTTON_PRESSED(BUTTON_UP)) {
                    if (playerX > boxX && playerX < (boxX + boxWidth - 1) && playerY == (boxY + boxHeight - 1)) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 2;
                    }
                }

                if (BUTTON_PRESSED(BUTTON_RIGHT)) {
                    if (playerY > boxY && playerY < (boxY + boxHeight - 1) && playerX == boxX) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 3;
                    }
                }
                break;
            case PAUSE:
                waitForVBlank();
                drawPause();

                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToIdle();
                }
                break;
            case LINE:
                waitForVBlank();

                if (time % 3 == 0) {
                    updateBall();
                    drawBall(frame);
                }

                if (time % timestep == 0) {
                    drawBall(frame);
                    if (frame + 1 == 2) {
                        frame = 0;
                    } else {
                        frame++;
                    }
                    time = 0;
                }

                lineX = playerX;
                lineY = playerY;

                if (lineDirection == 0) {
                    if (collision(originX, originY, 1, lineY - originY, ballX, ballY, 2, 2)) {
                        drawRect(originX, originY, 1, lineY - originY, PINK);
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 1) {
                    if (collision(lineX, originY, originX - lineX, 1, ballX, ballY, 2, 2)) {
                        drawRect(lineX, originY, originX - lineX, 1, PINK);
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 2) {
                    if (collision(originX, lineY, 1, originY - lineY, ballX, ballY, 2, 2)) {
                        drawRect(originX, lineY, 1, originY - lineY, PINK);
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 3) {
                    if (collision(originX, originY, lineX - originX, 1, ballX, ballY, 2, 2)) {
                        drawRect(originX, originY, lineX - originX, 1, PINK);
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                }
                
                if (time % 2 == 0) {
                    drawLine(lineDirection);
                }

                time++;
                break;
            case WIN:
                waitForVBlank();
                drawWin();

                if (BUTTON_PRESSED(BUTTON_A)) {
                    initialize();
                }
                break;
            case LOSE:
                waitForVBlank();
                drawLose();

                if (BUTTON_PRESSED(BUTTON_A)) {
                    initialize();
                }
                break;
            default:
                break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    goToMenu();

    oldButtons = 0;
    buttons = REG_BUTTONS;

    bgColor = PURPLE;
    drawRect(0, 0, 50, 159, CYAN);
    drawString(7, 151, "Paused", GRAY);
    drawRect(50, 0, 190, 160, bgColor);
    drawRect(51, 1, 188, 158, PINK);

    drawHeart(2, 2);
    drawHeart(14, 2);
    drawHeart(26, 2);

    boxX = 50;
    boxY = 0;
    boxWidth = 190;
    boxHeight = 160;
    area = boxWidth * boxHeight;

    playerColor = WHITE;
    playerLength = 1;
    playerX = 50;
    playerY = 0;
    playerOldX = playerX;
    playerOldY = playerY;
    lifeLost = 0;
    // drawRect(playerX, playerY, playerLength, playerLength, playerColor);

    ballColor = RED;
    ballLength = 2;
    ballX = (boxX + boxWidth / 2) - (ballLength / 2);
    ballY = (boxY + boxHeight / 2) - (ballLength / 2);
    ballOldX = ballX;
    ballOldY = ballY;
    ballVelocityX = 1;
    ballVelocityY = 2;
    // drawRect(ballX, ballY, ballLength, ballLength, ballColor);

    lineDirection = 0;
    originX = 0;
    originY = 0;
    lineX = 0;
    lineY = 0;

    frame = 0;
    time = 0;
    lineTime = 0;
    lives = 3;
}

void update() {
    
}

void updateBall() {
    ballX += ballVelocityX;
    ballY += ballVelocityY;

    if (ballX <= boxX + 1) {
        if (ballX > 0) {
            ballX += boxX + 1 - ballX;
        } else if (ballX == 0) {
            ballX += boxX + 1;
        } else {
            ballX = -ballX;
        }
        ballVelocityX = -ballVelocityX;
    }
    if (ballY <= boxY + 1) {
        if (ballY > 0) {
            ballY += boxY + 1 - ballY;
        } else if (ballY == 0) {
            ballY += boxY + 1;
        } else {
            ballY = -ballY;
        }
        ballVelocityY = -ballVelocityY;
    }
    if (ballX + ballLength >= boxX + boxWidth - 1) {
        ballX -= ballX + ballLength - (boxX + boxWidth - 1);
        ballVelocityX = -ballVelocityX;
    }
    if (ballY + ballLength >= boxY + boxHeight - 1) {
        ballY -= ballY + ballLength - (boxY + boxHeight - 1);
        ballVelocityY = -ballVelocityY;
    }
}

void drawMenu() {
    drawRect(60, 75, 6 * 20, 9, BLACK);
    drawString(60, 76, "Press Enter to Start", WHITE);
}

void drawPause() {
    // drawRect(1, 1, 6 * 6 + 1, 9, BLACK);
    drawString(7, 151, "Paused", YELLOW);
}

void drawWin() {
    drawRect(96, 75, 8 * 6, 9, BLACK);
    drawString(96, 76, "YOU WIN!", GREEN);
    drawString(72, 90, "Press A to retry", WHITE);
}

void drawLose() {
    drawRect(87, 75, 11 * 6, 9, BLACK);
    drawString(87, 76, "YOU LOSE...", RED);
    drawString(72, 90, "Press A to retry", WHITE);
}

void drawLine(direction) {
    lineX = playerX;
    lineY = playerY;

    if (direction == 0 && playerY < (boxY + boxHeight - 1)) {
        playerY += 1;
        drawRect(originX, originY, 1, playerY - originY, GRAY);
    } else if (direction == 1 && playerX > (boxX)) {
        playerX -= 1;
        drawRect(playerX, playerY, (boxX + boxWidth - 1) - playerX, 1, GRAY);
    } else if (direction == 2 && playerY > boxY) {
        playerY -= 1;
        drawRect(playerX, playerY, 1, (boxY + boxHeight - 1) - playerY, GRAY);
    } else if (direction == 3 && playerX < (boxX + boxWidth - 1)) {
        playerX += 1;
        drawRect(originX, originY, playerX - originX, 1, GRAY);
    } else if (!lifeLost) {
        splitSquare(direction);
    }
}

void splitSquare(direction) {
    switch (direction) {
        case 0:
            if (ballX < playerX) {
                drawRect(originX + 1, originY, (boxX + boxWidth - originX), boxHeight, BLACK);
                boxWidth = originX - boxX + 1;
            } else if (ballX > playerX) {
                drawRect(boxX, boxY, ((originX) - boxX), boxHeight, BLACK);
                boxWidth = boxX + boxWidth - originX;
                boxX = originX;
            }
            break;
        case 2:
            if (ballX < playerX) {
                drawRect(originX + 1, boxY, (boxX + boxWidth - originX), boxHeight, BLACK);
                boxWidth = originX - boxX + 1;
            } else if (ballX > playerX) {
                drawRect(boxX, boxY, ((originX) - boxX), boxHeight, BLACK);
                boxWidth = boxX + boxWidth - originX;
                boxX = originX;
            }
            break;
        case 1:
            if (ballY < playerY) {
                drawRect(boxX, originY + 1, boxWidth, (boxY + boxHeight - originY), BLACK);
                boxHeight = originY - boxY + 1;
            } else if (ballY > playerY) {
                drawRect(boxX, boxY, boxWidth, originY - boxY, BLACK);
                boxHeight = boxY + boxHeight - originY;
                boxY = originY;
            }
            break;
        case 3:
            if (ballY < playerY) {
                drawRect(boxX, originY + 1, boxWidth, (boxY + boxHeight - originY), BLACK);
                boxHeight = originY - boxY + 1;
            } else if (ballY > playerY) {
                drawRect(boxX, boxY, boxWidth, originY - boxY, BLACK);
                boxHeight = boxY + boxHeight - originY;
                boxY = originY;
            }
        default:
            break;
    }
    playerX = boxX;
    playerY = boxY;
    area = boxWidth * boxHeight;
    state = IDLE;
}

void loseLife() {
    lives -= 1;
    if (lives == 2) {
        drawRect(26, 2, 9, 8, CYAN);
    } else if (lives == 1) {
        drawRect(14, 2, 21, 8, CYAN);
    } else if (lives == 0) {
        drawRect(2, 2, 33, 8, CYAN);
    }
}

void drawBall(frame) {
    drawRect(ballOldX, ballOldY, ballLength, ballLength, PINK);

    if (frame == 0) {
        drawRect(ballX, ballY, ballLength, ballLength, ballColor);
        drawRect(ballX + 1, ballY, ballLength - 1, ballLength, WHITE);
    } else if (frame == 1) {
        drawRect(ballX, ballY, ballLength, ballLength, ballColor);
        drawRect(ballX, ballY, ballLength - 1, ballLength, WHITE);
    }
    ballOldX = ballX;
    ballOldY = ballY;
}

void drawPlayer() {
    // mgba_printf("%d  %d", playerX, boxX + boxWidth);
    if (playerX + 1 > boxX + boxWidth - 1 && playerY + 1 <= boxY + boxHeight - 1) {
        playerY += 1;
    } else if (playerX - 1 >= boxX && playerY + 1 > boxY + boxHeight - 1) {
        playerX -= 1;
    } else if (playerX - 1 < boxX && playerY - 1 >= boxY) {
        playerY -= 1;
    } else if (playerX + 1 <= boxX + boxWidth - 1 && playerY - 1 <= boxY) {
        playerX += 1;
    }
    drawRect(playerOldX, playerOldY, playerLength, playerLength, bgColor);
    drawRect(playerX, playerY, playerLength, playerLength, playerColor);
    playerOldX = playerX;
    playerOldY = playerY;
}

void drawHeart(xCord, yCord) {
    drawRect(xCord + 2, yCord, 2, 1, BLACK);
    drawRect(xCord + 5, yCord, 2, 1, BLACK);
    drawRect(xCord + 2, yCord + 1, 2, 1, RED);
    drawRect(xCord + 5, yCord + 1, 2, 1, RED);
    drawRect(xCord, yCord + 2, 1, 2, BLACK);
    drawRect(xCord + 8, yCord + 2, 1, 2, BLACK);
    drawRect(xCord + 1, yCord + 2, 1, 2, DARKRED);
    drawRect(xCord + 2, yCord + 2, 6, 2, RED);
    drawRect(xCord + 3, yCord + 4, 3, 2, RED);
    setPixel(xCord + 1, yCord + 1, BLACK);
    setPixel(xCord + 4, yCord + 1, BLACK);
    setPixel(xCord + 7, yCord + 1, BLACK);
    setPixel(xCord + 5, yCord + 2, WHITE);
    setPixel(xCord + 6, yCord + 3, WHITE);
    setPixel(xCord + 1, yCord + 4, BLACK);
    setPixel(xCord + 2, yCord + 4, DARKRED);
    setPixel(xCord + 6, yCord + 4, RED);
    setPixel(xCord + 7, yCord + 4, BLACK);
    setPixel(xCord + 2, yCord + 5, BLACK);
    setPixel(xCord + 6, yCord + 5, BLACK);
    setPixel(xCord + 3, yCord + 5, DARKRED);
    setPixel(xCord + 3, yCord + 6, BLACK);
    setPixel(xCord + 4, yCord + 6, DARKRED);
    setPixel(xCord + 5, yCord + 6, BLACK);
    setPixel(xCord + 4, yCord + 7, BLACK);

}

void goToMenu() {
    state = MENU;
}

void goToIdle() {
    state = IDLE;
    drawString(7, 151, "Paused", GRAY);
}

void goToPause() {
    state = PAUSE;
}

void goToWin() {
    state = WIN;
}

void goToLose() {
    state = LOSE;
}