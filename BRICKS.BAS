    '************ PELOTA REBOTANDO *************
    '
    CLEAR : KEY OFF: SCREEN 1: COLOR 0, 1: CLS : DEFINT A-Z
    LOCATE 4, 1: PRINT "Bienvenido al JUEGO CON PALETA"
    LOCATE 8, 1: PRINT "Reglas: 1 punto por cada golpe, "
    LOCATE 10, 8: PRINT "-1 punto por cada fallo"
    LOCATE 14, 1: RANDOMIZE: CLS
    
    DIM pelota(34), paleta(22)
    P% = 8: punt = 0
    DX = 10: DY = 10
    DX% = 5 * (INT(4 * RND) + 1): DY% = 5 * (INT(4 * RND) + 1)
   
    '*********DIBUJO DE FIGURAS INICIALES************
240 X = 10 + INT(300 * RND): Y = 10 + INT(164 * RND)
    CIRCLE (X, Y), 5
    PAINT (X, Y)
    GET (X% - 5, Y% - 5)-(X% + 5, Y% + 5), pelota
    LINE (0, P%)-(6, P% + 20), 3, BF: GET (0, P%)-(6, P% + 20), paleta
    PUT (0, P%), paleta                   'borrrado de paleta
  
    '**********************DIBUJO DEL CONTORNO***************
    LINE (0, 0)-(319, 5), 2, BF
    LINE (0, 178)-(319, 183), 2, BF
    LINE (314, 6)-(319, 177), 2, BF
  
    '*** COMIENZO DEL BUCLE*****
    LOCATE 25, 1: PRINT "Puntaci¢n:"; punt;
    LOCATE 25, 17: PRINT "salida barra espaciadora";
300 X1% = X% + DX%: Y1% = Y% + DY%: F$ = INKEY$
    IF F$ = " " THEN CHAIN "MENU"
    IF F$ = CHR$(0) + "P" THEN P1% = P1% + 18
    IF F$ = CHR$(0) + "H" THEN P1% = P1% - 18
    IF P1% < 6 THEN P1% = 6: GOTO 330
    IF P1% > 157 THEN P1% = 157
330 IF X1% >= 12 THEN 350
    IF Y1% >= P1 - 2 AND Y1% <= P1 + 22 THEN GOSUB 480 ELSE GOSUB 530
350 IF X1% > 308 THEN X1% = 308: DX% = -DX%: SOUND 1000, 2
360 IF Y1% < 11 THEN Y1% = 11: DY% = -DY%: SOUND 1000, 2: GOTO 380
    IF Y1% > 172 THEN Y1% = 172: DY% = -DY%: SOUND 1000, 2
380 PUT (X% - 5, Y% - 5), pelota       'borrado de pelota
    PUT (X1% - 5, Y1% - 5), pelota      'nuevo dibujo de la pelota
    PUT (0, P1%), paleta                  'borrado de la paleta
    FOR C = 1 TO 1300: NEXT C
    PUT (0, P1%), paleta                'nuevo dibujo de la paleta
    X% = X1: Y% = Y1%
    FOR D = 1 TO 10: NEXT D
    GOTO 300
    '******************GOLPEO DE LA PELOTA CON LA PALETA***************
480 X1 = 12: DX = -DX: punt = punt + 1: SOUND 2000, 2
    LOCATE 25, 11: PRINT punt; : RETURN 360
530 IF X1 >= 5 THEN RETURN 360
    PUT (X - 5, Y - 5), pelota: PUT (0, P), paleta
    DX = 10: DY = 10: punt = punt - 1: SOUND 50, 2
    LOCATE 25, 11: PRINT punt;
    FOR i = 1 TO 1000: NEXT i: RETURN 240

