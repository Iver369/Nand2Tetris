// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
@KBD
D=M   
@BLACK
D;JGT  
@WHITE
0;JMP

(BLACK)
@color
M=-1
@DRAW
0;JMP

(WHITE)
@color
M=0
@DRAW
0;JMP

(DRAW)
@SCREEN
D=A
@pixelPointer
M=D

@8192
D=D+A
@final_pixelPointer
M=D
@pixelPointer

(PIXEL)  
@pixelPointer
D=M
@final_pixelPointer
D=D-M
@LOOP
D;JEQ  

@color
D=M
@pixelPointer
A=M   
M=D     

@pixelPointer
M=M+1

@PIXEL
0;JMP