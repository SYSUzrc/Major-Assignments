DATA SEGMENT
    X DB 51H,3AH,95H,8DH,90H,0A7H,0C1H,77H,24H,0B1H
DATA ENDS

STACK SEGMENT 
    DW 20H DUP(0)
STACK ENDS    

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE         
    
START:
    MOV AX,DATA
    MOV DS,AX
    CALL BUBBLE_SORT
    MOV CL,9
    MOV SI,OFFSET X
    MOV DI,3000H
    MOV CX,10
    
COPY_SORT:
    MOV AL,[SI]
    MOV [DI],AL
    
    INC SI
    INC DI
    LOOP COPY_SORT
    
    MOV AH,4CH
    INT 21H
    
BUBBLE_SORT PROC
    PUSH CX
    PUSH SI
    PUSH DI
    
    MOV DH,9
    
LOOP1:
    MOV SI,OFFSET X
    MOV CL,9
    
LOOP2:
    MOV AL,[SI]
    MOV DL,[SI+1]
    CMP AL,DL 
    JBE LOOP3
    
    MOV BL,AL
    MOV AL,DL
    MOV DL,BL
    MOV [SI],AL
    MOV [SI+1],DL
    
LOOP3:
    INC SI
    LOOP LOOP2
    
    DEC DH
    JNZ LOOP1
    
    POP CX
    POP SI
    POP DI
    RET
    
BUBBLE_SORT ENDP
CODE ENDS
    END START    