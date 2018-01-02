UNIT WinCpAPI;
{$H+}

interface
PROCEDURE cmd(command:string);
PROCEDURE Resize(cols:integer;lines:integer);
PROCEDURE ColScr(background:byte;text:byte);
PROCEDURE SpeakText(txt:String);
PROCEDURE WriteTxt(var tfile:text;x:integer;y:integer);
PROCEDURE PlaySound(path:String);
PROCEDURE PlayLoop(path:String);

implementation
uses crt,dos,sysutils,MMSystem,comobj;


//CMD Procedure
{Run Command Prompt Commandands using cmd('command');}
PROCEDURE cmd(command:string);
  VAR Shell:String;
  BEGIN
  Shell:=GetEnv('COMSPEC');
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
  
//Write Text File To Screen
PROCEDURE WriteTxt(var tfile:text;x:integer;y:integer);
  VAR txt:String;
  BEGIN
    Reset(Tfile);
    Repeat
      Readln(Tfile,txt);
      Gotoxy(x,y);
      Writeln(txt);
      y:=y+1;
    Until EOF(tfile);
    Close(Tfile);
  End;

//Play wave audio file
PROCEDURE PlaySound(path:String);
  VAR 
    filepath:Pchar;
  BEGIN
    filepath:=PCHAR(path);
    sndPlaySound(filepath, snd_Async or snd_NoDefault);
  End;

//Play wave audio file with loop
PROCEDURE PlayLoop(path:String);
  VAR 
    filepath:Pchar;
  BEGIN
    filepath:=PCHAR(Path);
    sndPlaySound(filepath, snd_Async or snd_NoDefault or snd_Loop);
  End;
  
End.