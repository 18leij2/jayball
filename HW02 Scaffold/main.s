	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	update
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	update, .-update
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L17
	ldr	r5, .L17+4
	ldr	r6, .L17+8
	ldr	lr, .L17+12
	ldr	r4, .L17+16
	ldr	r2, [r5]
	ldr	r1, [r3]
	ldr	r0, [r6]
	ldr	r3, [lr]
	ldr	ip, [r4]
	add	r2, r0, r2
	add	r7, r1, #1
	add	r3, ip, r3
	cmp	r2, r7
	str	r2, [r5]
	str	r3, [lr]
	bgt	.L4
	cmp	r2, #0
	ble	.L5
.L15:
	mov	r2, r7
	str	r7, [r5]
.L6:
	rsb	r0, r0, #0
	str	r0, [r6]
.L4:
	ldr	r0, .L17+20
	ldr	r0, [r0]
	add	r7, r0, #1
	cmp	r3, r7
	bgt	.L8
	cmp	r3, #0
	ble	.L9
.L16:
	mov	r3, r7
	str	r7, [lr]
.L10:
	rsb	ip, ip, #0
	str	ip, [r4]
.L8:
	ldr	r7, .L17+24
	ldr	ip, .L17+28
	ldr	r7, [r7]
	ldr	ip, [ip]
	add	r1, r1, r7
	sub	r1, r1, #1
	add	r7, ip, r2
	cmp	r7, r1
	blt	.L12
	ldr	r8, [r6]
	sub	r1, r7, r1
	sub	r1, r2, r1
	rsb	r2, r8, #0
	str	r1, [r5]
	str	r2, [r6]
.L12:
	ldr	r2, .L17+32
	ldr	r2, [r2]
	add	r2, r0, r2
	add	ip, ip, r3
	sub	r2, r2, #1
	cmp	ip, r2
	blt	.L3
	ldr	r1, [r4]
	sub	ip, ip, r2
	sub	r3, r3, ip
	rsb	r2, r1, #0
	str	r3, [lr]
	str	r2, [r4]
.L3:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	rsbne	r2, r2, #0
	strne	r2, [r5]
	bne	.L6
	b	.L15
.L9:
	rsbne	r3, r3, #0
	strne	r3, [lr]
	bne	.L10
	b	.L16
.L18:
	.align	2
.L17:
	.word	boxX
	.word	ballX
	.word	ballVelocityX
	.word	ballY
	.word	ballVelocityY
	.word	boxY
	.word	boxWidth
	.word	ballLength
	.word	boxHeight
	.size	updateBall, .-updateBall
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	drawMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMenu, %function
drawMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #9
	mov	r2, #120
	mov	r1, #75
	mov	r0, #60
	ldr	r4, .L21
	mov	lr, pc
	bx	r4
	mov	r1, #76
	mov	r0, #60
	ldr	r3, .L21+4
	ldr	r2, .L21+8
	ldr	r4, .L21+12
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	drawRect
	.word	32767
	.word	.LC0
	.word	drawString
	.size	drawMenu, .-drawMenu
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Paused\000"
	.text
	.align	2
	.global	drawPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPause, %function
drawPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #151
	ldr	r4, .L25
	mov	r0, #7
	ldr	r3, .L25+4
	ldr	r2, .L25+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	drawString
	.word	1023
	.word	.LC1
	.size	drawPause, .-drawPause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"YOU WIN!\000"
	.align	2
.LC3:
	.ascii	"Press A to retry\000"
	.text
	.align	2
	.global	drawWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWin, %function
drawWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #9
	mov	r2, #48
	mov	r1, #75
	mov	r0, #96
	ldr	r4, .L29
	mov	lr, pc
	bx	r4
	ldr	r4, .L29+4
	mov	r3, #992
	mov	r1, #76
	mov	r0, #96
	ldr	r2, .L29+8
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #72
	ldr	r3, .L29+12
	ldr	r2, .L29+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	drawRect
	.word	drawString
	.word	.LC2
	.word	32767
	.word	.LC3
	.size	drawWin, .-drawWin
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"YOU LOSE...\000"
	.text
	.align	2
	.global	drawLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLose, %function
drawLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #9
	mov	r2, #66
	mov	r1, #75
	mov	r0, #87
	ldr	r4, .L33
	mov	lr, pc
	bx	r4
	ldr	r4, .L33+4
	mov	r3, #31
	mov	r1, #76
	mov	r0, #87
	ldr	r2, .L33+8
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #72
	ldr	r3, .L33+12
	ldr	r2, .L33+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	drawRect
	.word	drawString
	.word	.LC4
	.word	32767
	.word	.LC3
	.size	drawLose, .-drawLose
	.align	2
	.global	splitSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	splitSquare, %function
splitSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L60
	sub	sp, sp, #8
	ldr	ip, [r4]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L36
.L38:
	.word	.L41
	.word	.L37
	.word	.L39
	.word	.L37
.L37:
	ldr	r3, .L60+4
	ldr	r5, .L60+8
	ldr	r2, [r3]
	ldr	r3, [r5]
	ldr	r6, .L60+12
	ldr	r7, .L60+16
	cmp	r2, r3
	ldr	r1, [r6]
	ldr	r2, [r7]
	blt	.L57
	bgt	.L50
	ldr	r3, .L60+20
	ldr	r6, .L60+24
	ldr	r3, [r3]
	b	.L42
.L41:
	ldr	r3, .L60+28
	ldr	r6, .L60+24
	ldr	r2, [r3]
	ldr	r3, [r6]
	ldr	r5, .L60+20
	cmp	r2, r3
	ldr	r3, [r5]
	blt	.L58
	ldr	r7, .L60+12
	ldr	r1, [r7]
	bgt	.L46
.L52:
	ldr	r2, .L60+16
	ldr	r5, .L60+8
	ldr	r2, [r2]
.L42:
	mov	r0, #1
	mul	r2, r3, r2
	ldr	lr, .L60+32
	ldr	r3, .L60+36
	str	ip, [r6]
	str	r1, [r5]
	str	r2, [lr]
	strb	r0, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L39:
	ldr	r3, .L60+28
	ldr	r6, .L60+24
	ldr	r2, [r3]
	ldr	r3, [r6]
	ldr	r5, .L60+20
	ldr	r7, .L60+12
	cmp	r2, r3
	ldr	r1, [r7]
	ldr	r3, [r5]
	blt	.L59
	ble	.L52
.L46:
	mov	lr, #0
	ldr	r8, .L60+40
	ldr	r2, [r8]
	mov	r0, ip
	sub	r2, r2, ip
	str	lr, [sp]
	ldr	r9, .L60+44
	mov	lr, pc
	bx	r9
	ldr	r0, .L60+16
	ldr	r2, [r4]
	ldr	r3, [r0]
	ldr	ip, [r8]
	add	r2, r2, r3
	sub	r2, r2, ip
	ldr	r3, [r5]
	ldr	r1, [r7]
	str	r2, [r0]
	str	ip, [r4]
	ldr	r5, .L60+8
	b	.L42
.L50:
	mov	lr, #0
	ldr	r8, .L60+48
	ldr	r3, [r8]
	mov	r0, ip
	sub	r3, r3, r1
	str	lr, [sp]
	ldr	r9, .L60+44
	mov	lr, pc
	bx	r9
	ldr	r0, .L60+20
	ldr	r3, [r6]
	ldr	r2, [r0]
	ldr	r1, [r8]
	add	r2, r3, r2
	sub	r3, r2, r1
	str	r1, [r6]
	ldr	ip, [r4]
	ldr	r2, [r7]
	str	r3, [r0]
	ldr	r6, .L60+24
	b	.L42
.L57:
	mov	lr, #0
	ldr	r8, .L60+20
	ldr	r9, .L60+48
	ldr	r3, [r8]
	ldr	r10, [r9]
	add	r3, r1, r3
	sub	r3, r3, r10
	add	r1, r10, #1
	mov	r0, ip
	str	lr, [sp]
	ldr	r10, .L60+44
	mov	lr, pc
	bx	r10
	ldr	r1, [r6]
	ldr	r2, [r9]
	sub	r2, r2, r1
	add	r3, r2, #1
	str	r3, [r8]
	ldr	ip, [r4]
	ldr	r2, [r7]
	ldr	r6, .L60+24
	b	.L42
.L58:
	mov	lr, #0
	ldr	r7, .L60+16
	ldr	r8, .L60+40
	ldr	r2, [r7]
	ldr	r0, [r8]
	ldr	r1, .L60+48
	str	lr, [sp]
	add	r2, ip, r2
	sub	r2, r2, r0
	ldr	r1, [r1]
	ldr	r9, .L60+44
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	ldr	r2, [r8]
	ldr	ip, [r4]
	ldr	r1, .L60+12
	sub	r2, r2, ip
	add	r2, r2, #1
	ldr	r3, [r5]
	str	r2, [r7]
	ldr	r1, [r1]
	ldr	r5, .L60+8
	b	.L42
.L59:
	mov	lr, #0
	ldr	r8, .L60+16
	ldr	r9, .L60+40
	ldr	r2, [r8]
	ldr	r0, [r9]
	add	r2, ip, r2
	sub	r2, r2, r0
	str	lr, [sp]
	ldr	r10, .L60+44
	add	r0, r0, #1
	mov	lr, pc
	bx	r10
	ldr	r2, [r9]
	ldr	ip, [r4]
	sub	r2, r2, ip
	add	r2, r2, #1
	ldr	r3, [r5]
	str	r2, [r8]
	ldr	r1, [r7]
	ldr	r5, .L60+8
	b	.L42
.L36:
	ldr	r1, .L60+12
	ldr	r2, .L60+16
	ldr	r3, .L60+20
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r6, .L60+24
	ldr	r5, .L60+8
	b	.L42
.L61:
	.align	2
.L60:
	.word	boxX
	.word	ballY
	.word	playerY
	.word	boxY
	.word	boxWidth
	.word	boxHeight
	.word	playerX
	.word	ballX
	.word	area
	.word	state
	.word	originX
	.word	drawRect
	.word	originY
	.size	splitSquare, .-splitSquare
	.align	2
	.global	drawLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLine, %function
drawLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L71
	ldr	r4, .L71+4
	ldr	lr, [r5]
	ldr	r2, .L71+8
	ldr	ip, [r4]
	ldr	r3, .L71+12
	cmp	r0, #0
	str	lr, [r2]
	str	ip, [r3]
	sub	sp, sp, #8
	bne	.L63
	ldr	r2, .L71+16
	ldr	r3, .L71+20
	ldr	r2, [r2]
	ldr	r3, [r3]
	add	r2, r2, r3
	sub	r2, r2, #1
	cmp	ip, r2
	blt	.L69
.L64:
	ldr	r3, .L71+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L70
.L62:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	cmp	r0, #1
	bne	.L66
	ldr	r3, .L71+28
	ldr	r2, [r3]
	cmp	lr, r2
	ble	.L64
	ldr	r3, .L71+32
	ldr	r3, [r3]
	ldr	r6, .L71+36
	sub	r4, lr, #1
	add	r2, r2, r3
	str	r6, [sp]
	mov	r3, r0
	mov	r1, ip
	mov	r0, r4
	ldr	r6, .L71+40
	sub	r2, r2, lr
	str	r4, [r5]
	mov	lr, pc
	bx	r6
	b	.L62
.L66:
	cmp	r0, #2
	bne	.L67
	ldr	r3, .L71+16
	ldr	r3, [r3]
	cmp	ip, r3
	ble	.L64
	ldr	r2, .L71+20
	ldr	r1, [r2]
	ldr	r2, .L71+36
	add	r3, r3, r1
	sub	r1, ip, #1
	str	r2, [sp]
	mov	r0, lr
	str	r1, [r4]
	mov	r2, #1
	ldr	r4, .L71+40
	sub	r3, r3, ip
	mov	lr, pc
	bx	r4
	b	.L62
.L67:
	cmp	r0, #3
	bne	.L64
	ldr	r3, .L71+28
	ldr	r2, .L71+32
	ldr	r3, [r3]
	ldr	r2, [r2]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	lr, r3
	bge	.L64
	ldr	r3, .L71+44
	ldr	r2, .L71+48
	ldr	r0, [r3]
	ldr	r3, .L71+36
	add	lr, lr, #1
	ldr	r1, [r2]
	ldr	r4, .L71+40
	str	r3, [sp]
	sub	r2, lr, r0
	mov	r3, #1
	str	lr, [r5]
	mov	lr, pc
	bx	r4
	b	.L62
.L70:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	splitSquare
.L69:
	ldr	r3, .L71+48
	ldr	r2, .L71+44
	ldr	r1, [r3]
	ldr	r3, .L71+36
	add	ip, ip, #1
	ldr	r0, [r2]
	str	r3, [sp]
	mov	r2, #1
	str	ip, [r4]
	sub	r3, ip, r1
	ldr	r4, .L71+40
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	playerX
	.word	playerY
	.word	lineX
	.word	lineY
	.word	boxY
	.word	boxHeight
	.word	lifeLost
	.word	boxX
	.word	boxWidth
	.word	15855
	.word	drawRect
	.word	originX
	.word	originY
	.size	drawLine, .-drawLine
	.align	2
	.global	loseLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseLife, %function
loseLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L81
	push	{r4, lr}
	ldr	r1, [r3]
	sub	r1, r1, #1
	cmp	r1, #2
	str	r1, [r3]
	sub	sp, sp, #8
	beq	.L78
	cmp	r1, #1
	beq	.L79
	cmp	r1, #0
	beq	.L80
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L80:
	mov	r1, #2
	ldr	r3, .L81+4
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #33
	mov	r3, #8
	ldr	r4, .L81+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L78:
	ldr	r3, .L81+4
	mov	r2, #9
	str	r3, [sp]
	mov	r0, #26
	mov	r3, #8
	ldr	r4, .L81+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L79:
	ldr	r2, .L81+4
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #2
	mov	r2, #21
	mov	r0, #14
	ldr	r4, .L81+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	lives
	.word	32736
	.word	drawRect
	.size	loseLife, .-loseLife
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	ldr	r8, .L89
	ldr	ip, .L89+4
	ldr	r3, [r8]
	ldr	r5, .L89+8
	ldr	r6, .L89+12
	sub	sp, sp, #8
	mov	r2, r3
	ldr	r1, [r5]
	ldr	r0, [r6]
	str	ip, [sp]
	ldr	r7, .L89+16
	mov	lr, pc
	bx	r7
	cmp	r4, #0
	beq	.L87
	ldr	r10, .L89+20
	ldr	r9, .L89+24
	cmp	r4, #1
	ldr	r0, [r10]
	ldr	r1, [r9]
	beq	.L88
.L85:
	str	r0, [r6]
	str	r1, [r5]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L87:
	ldr	r2, .L89+28
	ldrh	r2, [r2]
	ldr	r3, [r8]
	str	r2, [sp]
	ldr	r4, .L89+24
	ldr	r9, .L89+20
	mov	r2, r3
	ldr	r1, [r4]
	ldr	r0, [r9]
	mov	lr, pc
	bx	r7
	ldr	r0, [r9]
	ldr	r3, [r8]
	ldr	ip, .L89+32
	ldr	r1, [r4]
	add	r0, r0, #1
	str	ip, [sp]
	sub	r2, r3, #1
	mov	lr, pc
	bx	r7
	ldr	r0, [r9]
	ldr	r1, [r4]
	b	.L85
.L88:
	ldr	r2, .L89+28
	ldr	r3, [r8]
	ldrh	r2, [r2]
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r7
	ldr	r1, .L89+32
	ldr	r3, [r8]
	str	r1, [sp]
	ldr	r0, [r10]
	ldr	r1, [r9]
	sub	r2, r3, #1
	mov	lr, pc
	bx	r7
	ldr	r0, [r10]
	ldr	r1, [r9]
	b	.L85
.L90:
	.align	2
.L89:
	.word	ballLength
	.word	31196
	.word	ballOldY
	.word	ballOldX
	.word	drawRect
	.word	ballX
	.word	ballY
	.word	ballColor
	.word	32767
	.size	drawBall, .-drawBall
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L105
	ldr	r3, .L105+4
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r0, [r2]
	ldr	r3, [r3]
	ldr	r5, .L105+8
	add	r3, r0, r3
	ldr	r2, [r5]
	sub	r3, r3, #1
	ldr	r1, .L105+12
	ldr	r4, .L105+16
	cmp	r3, r2
	ldr	ip, [r1]
	ldr	r3, [r4]
	sub	sp, sp, #12
	bgt	.L92
	ldr	r1, .L105+20
	ldr	r1, [r1]
	add	r1, ip, r1
	sub	r1, r1, #1
	cmp	r1, r3
	addgt	r3, r3, #1
	strgt	r3, [r4]
	bgt	.L94
	cmp	r0, r2
	bge	.L103
.L97:
	sub	r2, r2, #1
	str	r2, [r5]
.L94:
	ldr	r9, .L105+24
	ldr	r2, .L105+28
	ldr	r3, [r9]
	ldrh	r1, [r2]
	ldr	r6, .L105+32
	ldr	r7, .L105+36
	mov	r2, r3
	str	r1, [sp]
	ldr	r0, [r7]
	ldr	r1, [r6]
	ldr	r8, .L105+40
	mov	lr, pc
	bx	r8
	ldr	r2, .L105+44
	ldr	r3, [r9]
	ldrh	r1, [r2]
	ldr	r0, [r5]
	mov	r2, r3
	str	r1, [sp]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r8
	ldr	r2, [r5]
	ldr	r3, [r4]
	str	r2, [r7]
	str	r3, [r6]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L92:
	cmp	r0, r2
	blt	.L104
	cmp	r3, ip
	ble	.L96
.L99:
	sub	r3, r3, #1
	str	r3, [r4]
	b	.L94
.L104:
	ldr	r1, .L105+20
	ldr	r1, [r1]
	add	r1, ip, r1
	sub	r1, r1, #1
	cmp	r1, r3
	ble	.L97
.L96:
	sub	r3, r3, #1
	cmp	r3, ip
	addle	r2, r2, #1
	strle	r2, [r5]
	b	.L94
.L103:
	cmp	r3, ip
	ble	.L94
	b	.L99
.L106:
	.align	2
.L105:
	.word	boxX
	.word	boxWidth
	.word	playerX
	.word	boxY
	.word	playerY
	.word	boxHeight
	.word	playerLength
	.word	bgColor
	.word	playerOldY
	.word	playerOldX
	.word	drawRect
	.word	playerColor
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeart, %function
drawHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r6, r0
	mov	r9, r1
	add	r3, r0, #2
	mov	r10, r3
	mov	fp, #31
	sub	sp, sp, #28
	ldr	r7, .L109
	add	r8, r6, #5
	mov	r0, r3
	mov	r2, #2
	mov	r3, #1
	str	r4, [sp]
	mov	lr, pc
	bx	r7
	mov	r0, r8
	mov	r1, r9
	mov	r3, #1
	mov	r2, #2
	str	r4, [sp]
	mov	lr, pc
	bx	r7
	mov	r0, r10
	str	r10, [sp, #12]
	mov	r10, fp
	add	r5, r9, #1
	mov	r1, r5
	str	fp, [sp]
	mov	r3, #1
	mov	r2, #2
	mov	lr, pc
	bx	r7
	add	fp, r9, #2
	mov	r1, r5
	mov	r0, r8
	str	r10, [sp]
	mov	r3, #1
	mov	r2, #2
	mov	lr, pc
	bx	r7
	mov	r1, fp
	mov	r0, r6
	mov	r3, #2
	mov	r2, #1
	str	r4, [sp]
	mov	lr, pc
	bx	r7
	mov	r1, fp
	add	r0, r6, #8
	mov	r3, #2
	mov	r2, #1
	str	r4, [sp]
	mov	lr, pc
	bx	r7
	ldr	r2, .L109+4
	add	r10, r6, #1
	mov	r1, fp
	mov	r0, r10
	str	r2, [sp]
	mov	r3, #2
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	r1, fp
	mov	fp, #31
	add	ip, r6, #3
	str	fp, [sp]
	ldr	r0, [sp, #12]
	mov	r3, #2
	mov	r2, #6
	str	ip, [sp, #16]
	mov	lr, pc
	bx	r7
	add	r1, r9, #4
	mvn	r9, #32768
	str	fp, [sp]
	add	r0, r6, #3
	mov	r3, #2
	mov	r2, #3
	mov	lr, pc
	bx	r7
	rsb	r5, r5, r5, lsl #4
	ldr	r3, .L109+8
	lsl	r2, r5, #4
	ldr	r3, [r3]
	add	r7, r6, #6
	add	r1, r6, #4
	add	r0, r6, #7
	add	lr, r10, r5, lsl #4
	add	r6, r2, #480
	add	r6, r6, r7
	lsl	lr, lr, #1
	strh	r4, [r3, lr]	@ movhi
	lsl	r6, r6, #1
	add	lr, r1, r5, lsl #4
	add	r5, r0, r5, lsl #4
	str	r6, [sp, #20]
	add	ip, r2, #240
	lsl	lr, lr, #1
	lsl	r5, r5, #1
	strh	r4, [r3, lr]	@ movhi
	add	ip, ip, r8
	strh	r4, [r3, r5]	@ movhi
	ldr	r5, [sp, #20]
	add	lr, r2, #720
	lsl	ip, ip, #1
	strh	r9, [r3, ip]	@ movhi
	add	r10, r10, lr
	strh	r9, [r3, r5]	@ movhi
	ldr	ip, [sp, #16]
	ldr	r9, [sp, #12]
	add	r0, r0, lr
	add	r6, r2, #960
	lsl	fp, r10, #1
	lsl	r10, r0, #1
	add	r0, r2, #1200
	add	r2, r2, #1440
	add	r5, r9, lr
	add	r8, r8, r0
	add	r2, r2, r1
	add	lr, r7, lr
	add	r1, r1, r0
	add	r9, r9, r6
	add	r0, ip, r0
	add	ip, ip, r6
	add	r6, r7, r6
	ldr	r7, .L109+4
	lsl	r5, r5, #1
	strh	r4, [r3, fp]	@ movhi
	strh	r7, [r3, r5]	@ movhi
	mov	r5, #31	@ movhi
	lsl	ip, ip, #1
	lsl	r0, r0, #1
	lsl	r1, r1, #1
	lsl	r8, r8, #1
	lsl	r2, r2, #1
	lsl	lr, lr, #1
	lsl	r9, r9, #1
	lsl	r6, r6, #1
	strh	r5, [r3, lr]	@ movhi
	strh	r4, [r3, r10]	@ movhi
	strh	r4, [r3, r9]	@ movhi
	strh	r4, [r3, r6]	@ movhi
	strh	r7, [r3, ip]	@ movhi
	strh	r4, [r3, r0]	@ movhi
	strh	r7, [r3, r1]	@ movhi
	strh	r4, [r3, r8]	@ movhi
	strh	r4, [r3, r2]	@ movhi
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	drawRect
	.word	2129
	.word	videoBuffer
	.size	drawHeart, .-drawHeart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, #67108864
	mov	r4, #0
	ldr	r0, .L113
	ldr	r1, .L113+4
	ldr	r3, .L113+8
	strh	r0, [r2]	@ movhi
	strb	r4, [r1]
	strh	r4, [r3]	@ movhi
	add	r2, r2, #256
	ldr	lr, .L113+12
	ldr	ip, .L113+16
	ldrh	r5, [r2, #48]
	ldr	r6, .L113+20
	ldr	r3, .L113+24
	sub	sp, sp, #12
	str	r3, [sp]
	mov	r1, r4
	strh	r5, [lr]	@ movhi
	strh	ip, [r6]	@ movhi
	ldr	r5, .L113+28
	mov	r0, r4
	mov	r3, #159
	mov	r2, #50
	mov	lr, pc
	bx	r5
	ldr	r7, .L113+32
	mov	r1, #151
	mov	r0, #7
	ldr	r3, .L113+36
	ldr	r2, .L113+40
	mov	lr, pc
	bx	r7
	ldrh	r3, [r6]
	mov	r1, r4
	str	r3, [sp]
	mov	r2, #190
	mov	r3, #160
	mov	r0, #50
	mov	lr, pc
	bx	r5
	ldr	r2, .L113+44
	mov	r3, #158
	str	r2, [sp]
	mov	r1, #1
	mov	r2, #188
	mov	r0, #51
	mov	lr, pc
	bx	r5
	mov	r1, #2
	mov	r0, r1
	bl	drawHeart
	mov	r1, #2
	mov	r0, #14
	bl	drawHeart
	mov	r1, #2
	mov	r0, #26
	bl	drawHeart
	mov	r3, #50
	mov	r8, #190
	ldr	r9, .L113+48
	mov	r7, #160
	str	r4, [r9]
	ldr	r9, .L113+52
	mvn	r5, #32768
	str	r4, [r9]
	ldr	r9, .L113+56
	mov	ip, #1
	str	r4, [r9]
	ldr	r9, .L113+60
	mov	r0, #2
	str	r4, [r9]
	mov	r6, #31
	ldr	r9, .L113+64
	mov	r1, #144
	str	r4, [r9]
	mov	r2, #79
	mov	lr, #3
	ldr	r9, .L113+68
	str	r4, [r9]
	ldr	r9, .L113+72
	str	r4, [r9]
	ldr	r9, .L113+76
	str	r4, [r9]
	ldr	r9, .L113+80
	str	r4, [r9]
	ldr	r9, .L113+84
	str	r4, [r9]
	ldr	r9, .L113+88
	str	r4, [r9]
	ldr	r9, .L113+92
	str	r4, [r9]
	ldr	r4, .L113+96
	str	r3, [r4]
	ldr	r4, .L113+100
	str	r3, [r4]
	ldr	r4, .L113+104
	str	r3, [r4]
	ldr	r3, .L113+108
	str	r8, [r3]
	ldr	r3, .L113+112
	str	r7, [r3]
	ldr	r3, .L113+116
	ldr	r4, .L113+120
	strh	r5, [r3]	@ movhi
	ldr	r3, .L113+124
	str	ip, [r4]
	str	ip, [r3]
	ldr	r5, .L113+128
	ldr	r4, .L113+132
	ldr	r3, .L113+136
	strh	r6, [r5]	@ movhi
	str	r0, [r4]
	str	r0, [r3]
	ldr	r7, .L113+140
	ldr	r6, .L113+144
	ldr	r5, .L113+148
	ldr	r4, .L113+152
	ldr	ip, .L113+156
	ldr	r3, .L113+160
	ldr	r0, .L113+164
	str	r1, [r7]
	str	r1, [r6]
	str	r2, [r5]
	str	r2, [r4]
	str	lr, [ip]
	str	r0, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	1027
	.word	state
	.word	oldButtons
	.word	buttons
	.word	25835
	.word	bgColor
	.word	32736
	.word	drawRect
	.word	drawString
	.word	15855
	.word	.LC1
	.word	31196
	.word	boxY
	.word	playerY
	.word	playerOldY
	.word	lifeLost
	.word	lineDirection
	.word	originX
	.word	originY
	.word	lineX
	.word	lineY
	.word	frame
	.word	time
	.word	lineTime
	.word	boxX
	.word	playerX
	.word	playerOldX
	.word	boxWidth
	.word	boxHeight
	.word	playerColor
	.word	playerLength
	.word	ballVelocityX
	.word	ballColor
	.word	ballLength
	.word	ballVelocityY
	.word	ballX
	.word	ballOldX
	.word	ballY
	.word	ballOldY
	.word	lives
	.word	area
	.word	30400
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Debug log initialized!\000"
	.align	2
.LC6:
	.ascii	"%c\000"
	.align	2
.LC7:
	.ascii	"%d   %d   %d\000"
	.global	__aeabi_idivmod
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r3, .L218
	sub	sp, sp, #28
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+4
	ldr	r0, .L218+8
	mov	r4, r3
	ldr	r6, .L218+12
	mov	lr, pc
	bx	r3
	mov	r1, #188
	ldr	r0, .L218+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L218+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L218+24
	ldr	r5, .L218+28
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r8, .L218+32
	ldr	r10, .L218+36
	ldr	r7, .L218+40
	ldr	r9, .L218+44
.L116:
	ldrh	r3, [r4]
	ldr	r1, .L218+48
.L117:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r1, #48]
	strh	r3, [r4]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L117
.L119:
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L118
.L118:
	mov	lr, pc
	bx	r8
	ldr	r3, .L218+52
.L206:
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bne	.L125
	ldrh	r3, [r5]
	tst	r3, #1
	bne	.L207
.L125:
	ldrb	r2, [r6]	@ zero_extendqisi2
	b	.L116
.L120:
	mov	lr, pc
	bx	r8
	ldr	r3, .L218+56
	b	.L206
.L121:
	mov	lr, pc
	bx	r8
	ldr	r0, [r7]
	ldr	r3, .L218+60
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r0, r3
	beq	.L208
.L142:
	ldr	r3, .L218+64
	ldr	r1, [r3]
	ldr	r3, .L218+68
	mov	lr, pc
	bx	r3
	subs	fp, r1, #0
	beq	.L209
.L143:
	ldr	r3, .L218+72
	ldr	fp, [r3]
	ldr	r3, .L218+76
	ldr	r0, [r3]
	ldr	r3, .L218+80
	ldr	r2, [r3]
	ldr	r3, .L218+84
	str	r0, [r3]
	ldr	r3, .L218+88
	cmp	fp, #0
	str	r2, [r3]
	beq	.L210
	cmp	fp, #1
	beq	.L211
	cmp	fp, #2
	beq	.L212
	cmp	fp, #3
	beq	.L213
.L147:
	ldr	r3, [r7]
	tst	r3, #1
	beq	.L214
.L151:
	add	r3, r3, #1
	str	r3, [r7]
	ldrb	r2, [r6]	@ zero_extendqisi2
	b	.L116
.L122:
	mov	lr, pc
	bx	r8
	ldr	r3, .L218+92
	mov	r1, #151
	mov	r0, #7
	ldr	r2, .L218+96
	ldr	ip, .L218+100
	mov	lr, pc
	bx	ip
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bne	.L125
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L125
	b	.L201
.L123:
	mov	lr, pc
	bx	r8
	mov	ip, #0
	ldr	lr, .L218+104
	ldr	r2, .L218+108
	ldr	r1, .L218+112
	ldr	r3, [r10]
	str	ip, [lr]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, .L218+116
	ldr	ip, .L218+4
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	cmp	r3, #624
	movle	r3, #4
	strble	r3, [r6]
	ldr	r3, .L218+120
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #5
	ldr	fp, [r7]
	strbeq	r3, [r6]
	tst	fp, #1
	beq	.L215
.L129:
	ldr	r3, .L218+60
	smull	r2, r3, fp, r3
	sub	r3, r3, fp, asr #31
	add	r3, r3, r3, lsl #1
	cmp	fp, r3
	beq	.L216
.L130:
	ldr	r3, .L218+64
	mov	r0, fp
	ldr	r1, [r3]
	ldr	r3, .L218+68
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	addne	fp, fp, #1
	beq	.L217
.L132:
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #4
	str	fp, [r7]
	bne	.L134
	ldrh	r3, [r5]
	tst	r3, #4
	movne	r3, #2
	strbne	r3, [r6]
.L134:
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L135
	ldrh	r2, [r5]
	tst	r2, #128
	beq	.L135
	ldr	r2, .L218+76
	ldr	r1, [r2]
	ldr	r2, .L218+124
	ldr	r2, [r2]
	cmp	r1, r2
	ble	.L135
	ldr	r0, .L218+108
	ldr	r0, [r0]
	add	r2, r2, r0
	cmp	r1, r2
	bge	.L135
	ldr	r2, .L218+80
	ldr	r0, .L218+128
	ldr	r2, [r2]
	ldr	r0, [r0]
	cmp	r2, r0
	bne	.L135
	mov	r0, #3
	ldr	ip, .L218+132
	str	r1, [ip]
	ldr	r1, .L218+136
	str	r2, [r1]
	ldr	r2, .L218+72
	strb	r0, [r6]
	str	r3, [r2]
.L135:
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L136
	ldrh	r3, [r5]
	tst	r3, #32
	beq	.L136
	ldr	r3, .L218+80
	ldr	r2, [r3]
	ldr	r3, .L218+128
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L136
	ldr	r1, .L218+112
	ldr	r1, [r1]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r2, r3
	bge	.L136
	ldr	r3, .L218+124
	ldr	r1, .L218+108
	ldr	r3, [r3]
	ldr	r1, [r1]
	add	r3, r3, r1
	ldr	r1, .L218+76
	ldr	r1, [r1]
	sub	r3, r3, #1
	cmp	r3, r1
	bne	.L136
	mov	r0, #3
	mov	r1, #1
	ldr	ip, .L218+132
	str	r3, [ip]
	ldr	r3, .L218+136
	str	r2, [r3]
	ldr	r3, .L218+72
	strb	r0, [r6]
	str	r1, [r3]
.L136:
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L137
	ldrh	r3, [r5]
	tst	r3, #64
	beq	.L137
	ldr	r3, .L218+76
	ldr	r2, [r3]
	ldr	r3, .L218+124
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L137
	ldr	r1, .L218+108
	ldr	r1, [r1]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r2, r3
	bge	.L137
	ldr	r3, .L218+128
	ldr	r1, .L218+112
	ldr	r3, [r3]
	ldr	r1, [r1]
	add	r3, r3, r1
	ldr	r1, .L218+80
	ldr	r1, [r1]
	sub	r3, r3, #1
	cmp	r3, r1
	bne	.L137
	mov	r0, #3
	mov	r1, #2
	ldr	ip, .L218+132
	str	r2, [ip]
	ldr	r2, .L218+136
	str	r3, [r2]
	ldr	r3, .L218+72
	strb	r0, [r6]
	str	r1, [r3]
.L137:
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L125
	ldrh	r3, [r5]
	tst	r3, #16
	beq	.L125
	ldr	r3, .L218+80
	ldr	r1, [r3]
	ldr	r3, .L218+128
	ldr	r3, [r3]
	cmp	r1, r3
	ble	.L125
	ldr	r2, .L218+112
	ldr	r2, [r2]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r1, r3
	bge	.L125
	ldr	r3, .L218+76
	ldr	r2, .L218+124
	ldr	r3, [r3]
	ldr	r2, [r2]
	cmp	r3, r2
	bne	.L125
	mov	r2, #3
	ldr	r0, .L218+132
	str	r3, [r0]
	ldr	r3, .L218+136
	str	r1, [r3]
	ldr	r3, .L218+72
	strb	r2, [r6]
	str	r2, [r3]
	b	.L116
.L124:
	mov	lr, pc
	bx	r8
	ldr	r3, .L218+140
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+48
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bne	.L125
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L125
	ldr	r2, .L218+144
	mov	r3, #9
	str	r2, [sp]
	mov	r1, #75
	mov	r2, #120
	mov	r0, #60
	ldr	ip, .L218+148
	mov	lr, pc
	bx	ip
.L201:
	mov	ip, #1
	ldr	r2, .L218+96
	strb	ip, [r6]
	mov	r1, #151
	mov	r0, #7
	ldr	r3, .L218+152
	ldr	ip, .L218+100
	mov	lr, pc
	bx	ip
	ldrb	r2, [r6]	@ zero_extendqisi2
	b	.L116
.L217:
	ldr	r3, .L218+156
	ldr	r0, [r9]
	str	r1, [sp, #20]
	mov	lr, pc
	bx	r3
	ldr	r3, [r9]
	ldr	r1, [sp, #20]
	cmp	r3, #1
	addne	r1, r3, #1
	mov	fp, #1
	str	r1, [r9]
	b	.L132
.L216:
	ldr	r3, .L218+160
	mov	lr, pc
	bx	r3
	ldr	r0, [r9]
	ldr	r3, .L218+156
	mov	lr, pc
	bx	r3
	ldr	fp, [r7]
	b	.L130
.L215:
	ldr	r3, .L218+164
	mov	lr, pc
	bx	r3
	ldr	fp, [r7]
	b	.L129
.L207:
	ldr	r3, .L218+20
	mov	lr, pc
	bx	r3
	ldrb	r2, [r6]	@ zero_extendqisi2
	b	.L116
.L214:
	ldr	r3, .L218+72
	ldr	r0, [r3]
	ldr	r3, .L218+168
	mov	lr, pc
	bx	r3
	ldr	r3, [r7]
	b	.L151
.L210:
	mov	r3, #2
	ldr	r0, .L218+172
	ldr	ip, [r0]
	ldr	r0, .L218+176
	ldr	r1, .L218+136
	ldr	r0, [r0]
	ldr	r1, [r1]
	stm	sp, {r0, ip}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r0, .L218+132
	sub	r3, r2, r1
	ldr	r0, [r0]
	mov	r2, #1
	ldr	ip, .L218+180
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L147
	mov	fp, #1
	ldr	r3, .L218+136
	ldr	r1, [r3]
	ldr	r3, .L218+88
.L205:
	ldr	r2, .L218+144
	ldr	r3, [r3]
	str	r2, [sp]
	mov	r2, fp
	ldr	r0, .L218+132
	ldr	r0, [r0]
	sub	r3, r3, r1
.L202:
	ldr	ip, .L218+148
	mov	lr, pc
	bx	ip
	ldr	r3, .L218+124
	ldr	r1, .L218+104
	ldr	r2, [r3]
	str	fp, [r1]
	ldr	r3, .L218+128
	ldr	r1, .L218+76
	ldr	r3, [r3]
	str	r2, [r1]
	ldr	r2, .L218+80
	str	r3, [r2]
	ldr	r3, .L218+184
	mov	lr, pc
	bx	r3
	strb	fp, [r6]
	b	.L147
.L209:
	ldr	r3, .L218+156
	ldr	r0, [r9]
	mov	lr, pc
	bx	r3
	ldr	r3, [r9]
	cmp	r3, #1
	addne	fp, r3, #1
	mov	r3, #0
	str	fp, [r9]
	str	r3, [r7]
	b	.L143
.L208:
	ldr	r3, .L218+160
	mov	lr, pc
	bx	r3
	ldr	r0, [r9]
	ldr	r3, .L218+156
	mov	lr, pc
	bx	r3
	ldr	r0, [r7]
	b	.L142
.L211:
	mov	r3, #2
	ldr	r1, .L218+172
	ldr	ip, [r1]
	ldr	r1, .L218+176
	ldr	r2, .L218+132
	ldr	r1, [r1]
	ldr	r2, [r2]
	stm	sp, {r1, ip}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r1, .L218+136
	mov	r3, fp
	ldr	r1, [r1]
	ldr	ip, .L218+180
	sub	r2, r2, r0
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L147
	ldr	r3, .L218+84
	ldr	r0, [r3]
	ldr	r3, .L218+132
.L203:
	ldr	r2, [r3]
	ldr	r3, .L218+144
	ldr	r1, .L218+136
	str	r3, [sp]
	sub	r2, r2, r0
	mov	r3, fp
	ldr	r1, [r1]
	b	.L202
.L212:
	ldr	r1, .L218+172
	ldr	ip, [r1]
	ldr	r1, .L218+176
	ldr	r3, .L218+136
	ldr	r0, [r1]
	ldr	r3, [r3]
	stm	sp, {r0, ip}
	str	fp, [sp, #12]
	str	fp, [sp, #8]
	ldr	r0, .L218+132
	mov	r1, r2
	sub	r3, r3, r2
	ldr	r0, [r0]
	mov	r2, #1
	ldr	ip, .L218+180
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L147
	ldr	r3, .L218+88
	mov	fp, #1
	ldr	r1, [r3]
	ldr	r3, .L218+136
	b	.L205
.L213:
	mov	r2, #2
	ldr	r1, .L218+172
	ldr	ip, [r1]
	ldr	r1, .L218+176
	ldr	r3, .L218+132
	ldr	r1, [r1]
	ldr	r3, [r3]
	stm	sp, {r1, ip}
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	ldr	r1, .L218+136
	sub	r2, r0, r3
	ldr	r1, [r1]
	mov	r0, r3
	ldr	ip, .L218+180
	mov	r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L147
	ldr	r3, .L218+132
	mov	fp, #1
	ldr	r0, [r3]
	ldr	r3, .L218+84
	b	.L203
.L219:
	.align	2
.L218:
	.word	mgba_open
	.word	mgba_printf
	.word	.LC5
	.word	state
	.word	.LC6
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	waitForVBlank
	.word	area
	.word	time
	.word	frame
	.word	67109120
	.word	drawLose
	.word	drawWin
	.word	1431655766
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	lineDirection
	.word	playerX
	.word	playerY
	.word	lineX
	.word	lineY
	.word	1023
	.word	.LC1
	.word	drawString
	.word	lifeLost
	.word	boxWidth
	.word	boxHeight
	.word	.LC7
	.word	lives
	.word	boxX
	.word	boxY
	.word	originX
	.word	originY
	.word	drawMenu
	.word	31196
	.word	drawRect
	.word	15855
	.word	drawBall
	.word	updateBall
	.word	drawPlayer
	.word	drawLine
	.word	ballY
	.word	ballX
	.word	collision
	.word	loseLife
	.size	main, .-main
	.text
	.align	2
	.global	goToMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L221
	strb	r2, [r3]
	bx	lr
.L222:
	.align	2
.L221:
	.word	state
	.size	goToMenu, .-goToMenu
	.align	2
	.global	goToIdle
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToIdle, %function
goToIdle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L225
	ldr	r4, .L225+4
	mov	r1, #151
	mov	r0, #7
	ldr	r3, .L225+8
	ldr	r2, .L225+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L226:
	.align	2
.L225:
	.word	state
	.word	drawString
	.word	15855
	.word	.LC1
	.size	goToIdle, .-goToIdle
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L228
	strb	r2, [r3]
	bx	lr
.L229:
	.align	2
.L228:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L231
	strb	r2, [r3]
	bx	lr
.L232:
	.align	2
.L231:
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L234
	strb	r2, [r3]
	bx	lr
.L235:
	.align	2
.L234:
	.word	state
	.size	goToLose, .-goToLose
	.comm	boxOldHeight,4,4
	.comm	boxOldWidth,4,4
	.comm	boxHeight,4,4
	.comm	boxWidth,4,4
	.comm	boxOldY,4,4
	.comm	boxOldX,4,4
	.comm	boxY,4,4
	.comm	boxX,4,4
	.comm	ballVelocityY,4,4
	.comm	ballVelocityX,4,4
	.comm	ballLength,4,4
	.comm	ballOldY,4,4
	.comm	ballOldX,4,4
	.comm	ballY,4,4
	.comm	ballX,4,4
	.comm	playerLength,4,4
	.comm	playerOldY,4,4
	.comm	playerOldX,4,4
	.comm	playerY,4,4
	.comm	playerX,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	ballColor,2,2
	.comm	playerColor,2,2
	.comm	bgColor,2,2
	.comm	state,1,1
	.comm	lifeLost,4,4
	.comm	lineTime,4,4
	.comm	lineY,4,4
	.comm	lineX,4,4
	.comm	originY,4,4
	.comm	originX,4,4
	.comm	lineDirection,4,4
	.comm	lives,4,4
	.comm	area,4,4
	.comm	frame,4,4
	.global	timestep
	.comm	time,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timestep, %object
	.size	timestep, 4
timestep:
	.word	20
	.ident	"GCC: (devkitARM release 53) 9.1.0"
