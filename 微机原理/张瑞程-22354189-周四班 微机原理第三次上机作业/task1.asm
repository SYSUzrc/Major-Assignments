DATA SEGMENT
    X DB 51H,3AH,95H,8DH,90H,0A7H,0C1H,77H,24H,0B1H
    HIGH_COUNT DB 0
    LOW_COUNT DB 0
DATA ENDS

STACK SEGMENT 
    DW 20H DUP(0)
STACK ENDS    

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE         
    
START:
    MOV AX,DATA
    MOV DS,AX
    XOR AX,AX
    MOV CX,10
    LEA SI,X
    
COUNT:
    CALL COUNT_HL
    ADD AH,[HIGH_COUNT]
    ADD AL,[LOW_COUNT]
    
    INC SI
    LOOP COUNT
    MOV [3000H],AH
    MOV [3100H],AL
    
    MOV AH,4CH
    INT 21H 
       
COUNT_HL PROC
    PUSH AX
    PUSH CX
    XOR AH,AH
    XOR BH,BH
    MOV AL,[SI]
    MOV CL,8
    
LOOP1:
    TEST AL,80H
    JZ LOOP3

LOOP2:
    INC AH
    JMP LOOP4
    
LOOP3:
    INC BH
    
LOOP4:
    SHL AL,1
    LOOP LOOP1
    
LOOP5:
    MOV [HIGH_COUNT],AH
    MOV [LOW_COUNT],BH     
    POP CX
    POP AX  
    RET
    
COUNT_HL ENDP
CODE ENDS
    END START