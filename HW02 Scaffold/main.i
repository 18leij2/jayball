# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 59 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 76 "gba.h"
extern unsigned short oldButtons;
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2
# 1 "text.h" 1

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 4 "main.c" 2


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

    mgba_printf("%c", (char)188);

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state) {
            case MENU:
                waitForVBlank();
                drawMenu();
                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<3))) && !(~oldButtons & (1<<3))))) {
                    drawRect(60, 75, 6 * 20, 9, ((28&31) | (14&31) << 5 | (30&31) << 10));
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

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<2))) && !(~oldButtons & (1<<2))))) {
                    goToPause();
                }

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && !(~oldButtons & (1<<7))))) {
                    if (playerX > boxX && playerX < (boxX + boxWidth) && playerY == boxY) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 0;
                    }
                }

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && !(~oldButtons & (1<<5))))) {

                    if (playerY > boxY && playerY < (boxY + boxHeight - 1) && playerX == boxX + boxWidth - 1) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 1;
                    }
                }

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && !(~oldButtons & (1<<6))))) {
                    if (playerX > boxX && playerX < (boxX + boxWidth - 1) && playerY == (boxY + boxHeight - 1)) {
                        originX = playerX;
                        originY = playerY;
                        state = LINE;
                        lineDirection = 2;
                    }
                }

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && !(~oldButtons & (1<<4))))) {
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

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<3))) && !(~oldButtons & (1<<3))))) {
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
                        drawRect(originX, originY, 1, lineY - originY, ((28&31) | (14&31) << 5 | (30&31) << 10));
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 1) {
                    if (collision(lineX, originY, originX - lineX, 1, ballX, ballY, 2, 2)) {
                        drawRect(lineX, originY, originX - lineX, 1, ((28&31) | (14&31) << 5 | (30&31) << 10));
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 2) {
                    if (collision(originX, lineY, 1, originY - lineY, ballX, ballY, 2, 2)) {
                        drawRect(originX, lineY, 1, originY - lineY, ((28&31) | (14&31) << 5 | (30&31) << 10));
                        lifeLost = 1;
                        playerX = boxX;
                        playerY = boxY;
                        loseLife();
                        state = IDLE;
                    }
                } else if (lineDirection == 3) {
                    if (collision(originX, originY, lineX - originX, 1, ballX, ballY, 2, 2)) {
                        drawRect(originX, originY, lineX - originX, 1, ((28&31) | (14&31) << 5 | (30&31) << 10));
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

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<0))) && !(~oldButtons & (1<<0))))) {
                    initialize();
                }
                break;
            case LOSE:
                waitForVBlank();
                drawLose();

                if ((((~((*(volatile unsigned short *)0x04000130)) & ((1<<0))) && !(~oldButtons & (1<<0))))) {
                    initialize();
                }
                break;
            default:
                break;
        }
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1<<10);

    goToMenu();

    oldButtons = 0;
    buttons = (*(volatile unsigned short *)0x04000130);

    bgColor = ((11&31) | (7&31) << 5 | (25&31) << 10);
    drawRect(0, 0, 50, 159, ((0&31) | (31&31) << 5 | (31&31) << 10));
    drawString(7, 151, "Paused", ((15&31) | (15&31) << 5 | (15&31) << 10));
    drawRect(50, 0, 190, 160, bgColor);
    drawRect(51, 1, 188, 158, ((28&31) | (14&31) << 5 | (30&31) << 10));

    drawHeart(2, 2);
    drawHeart(14, 2);
    drawHeart(26, 2);

    boxX = 50;
    boxY = 0;
    boxWidth = 190;
    boxHeight = 160;
    area = boxWidth * boxHeight;

    playerColor = ((31&31) | (31&31) << 5 | (31&31) << 10);
    playerLength = 1;
    playerX = 50;
    playerY = 0;
    playerOldX = playerX;
    playerOldY = playerY;
    lifeLost = 0;


    ballColor = ((31&31) | (0&31) << 5 | (0&31) << 10);
    ballLength = 2;
    ballX = (boxX + boxWidth / 2) - (ballLength / 2);
    ballY = (boxY + boxHeight / 2) - (ballLength / 2);
    ballOldX = ballX;
    ballOldY = ballY;
    ballVelocityX = 1;
    ballVelocityY = 2;


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
    drawRect(60, 75, 6 * 20, 9, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawString(60, 76, "Press Enter to Start", ((31&31) | (31&31) << 5 | (31&31) << 10));
}

void drawPause() {

    drawString(7, 151, "Paused", ((31&31) | (31&31) << 5 | (0&31) << 10));
}

void drawWin() {
    drawRect(96, 75, 8 * 6, 9, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawString(96, 76, "YOU WIN!", ((0&31) | (31&31) << 5 | (0&31) << 10));
    drawString(72, 90, "Press A to retry", ((31&31) | (31&31) << 5 | (31&31) << 10));
}

void drawLose() {
    drawRect(87, 75, 11 * 6, 9, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawString(87, 76, "YOU LOSE...", ((31&31) | (0&31) << 5 | (0&31) << 10));
    drawString(72, 90, "Press A to retry", ((31&31) | (31&31) << 5 | (31&31) << 10));
}

void drawLine(direction) {
    lineX = playerX;
    lineY = playerY;

    if (direction == 0 && playerY < (boxY + boxHeight - 1)) {
        playerY += 1;
        drawRect(originX, originY, 1, playerY - originY, ((15&31) | (15&31) << 5 | (15&31) << 10));
    } else if (direction == 1 && playerX > (boxX)) {
        playerX -= 1;
        drawRect(playerX, playerY, (boxX + boxWidth - 1) - playerX, 1, ((15&31) | (15&31) << 5 | (15&31) << 10));
    } else if (direction == 2 && playerY > boxY) {
        playerY -= 1;
        drawRect(playerX, playerY, 1, (boxY + boxHeight - 1) - playerY, ((15&31) | (15&31) << 5 | (15&31) << 10));
    } else if (direction == 3 && playerX < (boxX + boxWidth - 1)) {
        playerX += 1;
        drawRect(originX, originY, playerX - originX, 1, ((15&31) | (15&31) << 5 | (15&31) << 10));
    } else if (!lifeLost) {
        splitSquare(direction);
    }
}

void splitSquare(direction) {
    switch (direction) {
        case 0:
            if (ballX < playerX) {
                drawRect(originX + 1, originY, (boxX + boxWidth - originX), boxHeight, ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxWidth = originX - boxX + 1;
            } else if (ballX > playerX) {
                drawRect(boxX, boxY, ((originX) - boxX), boxHeight, ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxWidth = boxX + boxWidth - originX;
                boxX = originX;
            }
            break;
        case 2:
            if (ballX < playerX) {
                drawRect(originX + 1, boxY, (boxX + boxWidth - originX), boxHeight, ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxWidth = originX - boxX + 1;
            } else if (ballX > playerX) {
                drawRect(boxX, boxY, ((originX) - boxX), boxHeight, ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxWidth = boxX + boxWidth - originX;
                boxX = originX;
            }
            break;
        case 1:
            if (ballY < playerY) {
                drawRect(boxX, originY + 1, boxWidth, (boxY + boxHeight - originY), ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxHeight = originY - boxY + 1;
            } else if (ballY > playerY) {
                drawRect(boxX, boxY, boxWidth, originY - boxY, ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxHeight = boxY + boxHeight - originY;
                boxY = originY;
            }
            break;
        case 3:
            if (ballY < playerY) {
                drawRect(boxX, originY + 1, boxWidth, (boxY + boxHeight - originY), ((0&31) | (0&31) << 5 | (0&31) << 10));
                boxHeight = originY - boxY + 1;
            } else if (ballY > playerY) {
                drawRect(boxX, boxY, boxWidth, originY - boxY, ((0&31) | (0&31) << 5 | (0&31) << 10));
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
        drawRect(26, 2, 9, 8, ((0&31) | (31&31) << 5 | (31&31) << 10));
    } else if (lives == 1) {
        drawRect(14, 2, 21, 8, ((0&31) | (31&31) << 5 | (31&31) << 10));
    } else if (lives == 0) {
        drawRect(2, 2, 33, 8, ((0&31) | (31&31) << 5 | (31&31) << 10));
    }
}

void drawBall(frame) {
    drawRect(ballOldX, ballOldY, ballLength, ballLength, ((28&31) | (14&31) << 5 | (30&31) << 10));

    if (frame == 0) {
        drawRect(ballX, ballY, ballLength, ballLength, ballColor);
        drawRect(ballX + 1, ballY, ballLength - 1, ballLength, ((31&31) | (31&31) << 5 | (31&31) << 10));
    } else if (frame == 1) {
        drawRect(ballX, ballY, ballLength, ballLength, ballColor);
        drawRect(ballX, ballY, ballLength - 1, ballLength, ((31&31) | (31&31) << 5 | (31&31) << 10));
    }
    ballOldX = ballX;
    ballOldY = ballY;
}

void drawPlayer() {

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
    drawRect(xCord + 2, yCord, 2, 1, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 5, yCord, 2, 1, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 2, yCord + 1, 2, 1, ((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 5, yCord + 1, 2, 1, ((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord, yCord + 2, 1, 2, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 8, yCord + 2, 1, 2, ((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 1, yCord + 2, 1, 2, ((17&31) | (2&31) << 5 | (2&31) << 10));
    drawRect(xCord + 2, yCord + 2, 6, 2, ((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(xCord + 3, yCord + 4, 3, 2, ((31&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 1) * (240) + (xCord + 1))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 1) * (240) + (xCord + 4))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 1) * (240) + (xCord + 7))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 2) * (240) + (xCord + 5))] = ((31&31) | (31&31) << 5 | (31&31) << 10));
    (videoBuffer[((yCord + 3) * (240) + (xCord + 6))] = ((31&31) | (31&31) << 5 | (31&31) << 10));
    (videoBuffer[((yCord + 4) * (240) + (xCord + 1))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 4) * (240) + (xCord + 2))] = ((17&31) | (2&31) << 5 | (2&31) << 10));
    (videoBuffer[((yCord + 4) * (240) + (xCord + 6))] = ((31&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 4) * (240) + (xCord + 7))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 5) * (240) + (xCord + 2))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 5) * (240) + (xCord + 6))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 5) * (240) + (xCord + 3))] = ((17&31) | (2&31) << 5 | (2&31) << 10));
    (videoBuffer[((yCord + 6) * (240) + (xCord + 3))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 6) * (240) + (xCord + 4))] = ((17&31) | (2&31) << 5 | (2&31) << 10));
    (videoBuffer[((yCord + 6) * (240) + (xCord + 5))] = ((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((yCord + 7) * (240) + (xCord + 4))] = ((0&31) | (0&31) << 5 | (0&31) << 10));

}

void goToMenu() {
    state = MENU;
}

void goToIdle() {
    state = IDLE;
    drawString(7, 151, "Paused", ((15&31) | (15&31) << 5 | (15&31) << 10));
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
