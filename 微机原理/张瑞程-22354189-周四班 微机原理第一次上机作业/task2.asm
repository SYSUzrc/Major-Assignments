DATA SEGMENT
    ; ����һ����Ϊ CHAR �����飬���� 26 ���ظ����ֽڣ���ʼֵ��Ϊ 0
    CHAR DB 26 DUP(0)
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:DATA

START:
    ; �� DI �Ĵ������ص� CHAR ����ĵ�ַ
    LEA DI, CHAR
    ; �� AL �Ĵ�������Ϊ�ַ� 'A' �� ASCII ��
    MOV AL, 'A'
    ; �� CX �Ĵ�������Ϊ 26��CX ����ѭ��������
    MOV CX, 26
STORE:
    ; �� AL �Ĵ�����ֵ�洢�� DI ָ����ڴ��ַ���� CHAR ������
    MOV [DI], AL
    ; �� DI �Ĵ������� 1��ָ����һ���ַ�λ��
    INC DI
    ; �� AL �Ĵ������� 1��ASCII ����������ַ�����
    INC AL
    LOOP STORE
CODE ENDS
END START