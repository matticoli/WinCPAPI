UNIT WinCpAPI;

interface
PROCEDURE cmd(command:string);
PROCEDURE Resize(cols:integer;lines:integer);
PROCEDURE ColScr(background:byte;text:byte);
//PROCEDURE SpeakText(txt:String);


implementation
uses crt,dos,sysutils,MMSystem,comobj;

VAR
  Shell:String;
  CommandHasBeenRun:Boolean;


//CMD Procedure
{Run Command Prompt Commandands using cmd('command');}
PROCEDURE cmd(command:string);
  BEGIN
    if CommandHasBeenRun=FALSE
      then 
        begin
          Shell:=GetEnv('COMSPEC');
          CommandHasBeenRun:=TRUE;
        end;
    Exec(Shell,'/c '+command);
  End;
  
//Screen Resize Procedure
PROCEDURE Resize(cols:integer;lines:integer);
VAR c,l:String;
  BEGIN
    c:=(IntToStr(cols));
    l:=(IntToStr(lines));
    cmd('mode con: cols='+c+' lines='+l);
    window(1,1,cols,lines);
  End;


//Color Screen Procedure
PROCEDURE ColScr(background:byte;text:byte);
  BEGIN
    textbackground(background);
    textcolor(text);
  End;

{
//Speak Text Procedure
PROCEDURE SpeakText(txt:String);
  VAR
    SavedCW: Word;
    SpVoice: Variant;
  BEGIN
    SpVoice := CreateOleObject('SAPI.SpVoice');
    SavedCW := Get8087CW;
    Set8087CW(SavedCW or $4);
    SpVoice.Speak(txt, 0);
    Set8087CW(SavedCW);
  End;
  }
End.
  
