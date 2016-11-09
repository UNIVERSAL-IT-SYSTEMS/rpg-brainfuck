**FREE

//Brainfuck by pure example.
// - WorksOfBarry

Ctl-Opt DftActGrp(*No) ActGrp(*NEW);

Dcl-Pr printf Int(10) ExtProc('printf');
  format Pointer Value Options(*String);
END-PR;
Dcl-S gAscii Int(3);
Dcl-S gChar  Char(1);

//Stores cells
Dcl-DS gCells Qualified;
  Index Int(5) Inz(2);
  Value Int(5) Dim(120) Inz(0);
END-DS;

Dcl-Ds gLoops Qualified;
  Index Int(5) Inz(1);
  Value Int(5) Dim(60);
END-DS;

//Holds the code
Dcl-S gCodeInd Int(5);
Dcl-S gCode    Char(128);
Dcl-S gCmd     Char(1);

gCode        = '++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.';
gCodeInd     = 1;
gCells.Index = 10;

Dow (gCodeInd <= %Len(gCode));
  gCmd = %Subst(gCode:gCodeInd:1);
  Select;
    When (gCmd = '>');
      gCells.Index += 1;
    When (gCmd = '<');
      gCells.Index -= 1;
    When (gCmd = '+');
      gCells.Value(gCells.Index) += 1;
    When (gCmd = '-');
      gCells.Value(gCells.Index) -= 1;
    When (gCmd = '[');
      gLoops.Value(gLoops.Index) = gCodeInd;
      gLoops.Index += 1;
    When (gCmd = ']');
      If (gCells.Value(gCells.Index) <> 0);
        gCodeInd = gLoops.Value(gLoops.Index-1);
      Else;
        gLoops.Index -= 1;
      ENDIF;
    When (gCmd = '.');
      gAscii = gCells.Value(gCells.Index);
      EXEC SQL SET :gChar = CHR(:gAscii);
      printf(gChar);
  ENDSL;
  gCodeInd += 1;
ENDDO;

*InLR = *On;
Return;
