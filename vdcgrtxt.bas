#RetroDevStudio.MetaData.BASIC:7169,BASIC V7.0 VDC,uppercase,10,10
10 REM TEXT IN GRAPHICS MODE USING VDC-BASIC

15 BE=PEEK(4624)+PEEK(4625)*256
20 GRAPHIC0:DD=PEEK(186):PRINT "PRESS KEY TO CONTINUE":GETKEY I$

30 BLOAD"VDCBASIC2D.AC6",U(DD),B0:SYS DEC("AC6")
31 RST3
32 CA=(RGD(DEC("1C")) AND 224)*256
33 VTR CA,BE,8192

40 ::RGO 28,16:REM 64K VRAM


41 CA=16384
42 RTV BE,CA,8192

#44 VMC CA,57344,8192
#45 CA=57344
46 AR=24576:ATTR AR

50 ::RGO 25,128:REM BITMAP MODE ON
# 2 SCANLINES PER CHAR, 156 SCANLINES (EACH VAL +1)
#60 ::RGW 0,127
#70 ::RGW 4,155
#80 ::RGW 6,100
#90 ::RGW 7,140
#100 ::RGW 9,1
110 ::RGW 36,0

120 VMF 0,0,16000
130 VMF AR,15,2000

199 FAST:S=TI
200 FOR X=0 TO 511
210  VMC CA+X*16,Y,1,16,80
215  Y=Y+1
216  C=C+1:IF C=80 THEN C=0:Y=Y+640
220 NEXT
221 PRINT TI-S:SLOW

