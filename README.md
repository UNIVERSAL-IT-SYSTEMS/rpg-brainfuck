# rpg-brainfuck
Brainfuck interpreter written in RPG.

The Brainfuck source is embedded in the code.

#### How to improve:

1:
```
Dcl-S gCodeInd Int(5);
Dcl-S gCode    Char(128);
Dcl-S gCmd     Char(1);
```

could be:
```
Dcl-S gCode    Char(128);
Dcl-S gCodeInd Pointer Inz(%Addr(gCode));
Dcl-S gCmd     Char(1) Based(gCodeInd);
```

Then there would no need to do a `%SUBST` every time we change the value of gCodeInd, since `gCmd` is based off that pointer.

2: `gCode` could potentially be a pointer in which we just allocate all the instructions too. This is so we don't have a fixed length for the amount of instructions we can have.

3: Read source code from IFS instead of hardcoding
