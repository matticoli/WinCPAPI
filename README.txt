WinCpAPI

Disclaimer
This unit is designed to work on Windows Vista,7,8,8.1 for Free Pascal Console Programs Only. This unit does NOT support graph windows, or Lazarus gui programs. (Due to issues with SAPI and FPC in Windows XP, this unit may not function on an XP System). 


Usage
Simply place the WinCpAPI.ppu and WinCpAPI.o files in the same directory as your program's source code (*.pas) and add WinCpAPI to your uses statement. Example: uses WinCpApi,crt; You can now use these procedures within your program. The program executable will not be dependent of the unit files, therefore your program will work without the .o and .ppu files present after it is compiled.