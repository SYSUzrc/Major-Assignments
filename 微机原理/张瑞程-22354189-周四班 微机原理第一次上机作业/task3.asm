DATA SEGMENT
    X DB 16H,35H,18H,12H,11H,5FH,98H,06H,10H,05H,36H,99H,0E1H,0CDH,20H,0F1H
    Y DB 23H,40H,29H,2CH,02H,8EH,2FH,03H,4CH,06H,57H,9BH,63H,FDH,05H,AAH 
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX
    ; �� SI �Ĵ������ص� X ����ĵ�ַ
    LEA SI, X
    ; �� DI �Ĵ������ص� Y ����ĵ�ַ
    LEA DI, Y
    ; �� BX �Ĵ�������Ϊ 2000H�����Ǵ洢�������ʼ��ַ
    MOV BX, 2000H
    MOV CX, 16   

STORE:
    MOV AL, DS:[SI]
    ADD AL, DS:[DI]
    CMP AL, 40H
    ; ��� AL ���ڻ���� 40H����ת�� NEXT ��ǩ�����洢 AL ��ֵ��
    JAE NEXT
    ; ���򣬽� AL ��ֵ�洢�� BX ָ����ڴ��ַ
    MOV DS:[BX], AL
    ; BX �Ĵ���������ָ����һ���洢λ��
    INC BX
NEXT:
    ; SI �Ĵ���������ָ�� X �������һ��Ԫ��
    INC SI
    ; DI �Ĵ���������ָ�� Y �������һ��Ԫ��
    INC DI
    LOOP STORE

CODE ENDS
END START