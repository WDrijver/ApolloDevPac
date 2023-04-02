Vampire users
-------------


Background:
-----------
Devpac is like a HiFi component set, it has 3 main parts.

- Editor 'Devpac' (can control/jump_to the others)
- Generate 'GenAm' convert text_file to Program (assembler)
- Debugger 'MonAm' Tool to look for Errors (debugger)


But it is from 25 years ago and does not know about ac68080



Recently:
---------
- MonAm was changed to be able to show the 080 stuff.
- VASM was made 68080 aware (assembler)
So we now can write for the 080 and see what is does in the debugger.
Use any Editor to write your program.

But until a editor is changed so that it can control/jump_to
the others you have to instruct them in another way. (script file)






What do you want the Editor to have?
- line_number indicator. So the Errors that VASM reports can be
  found.
- Good search, multiple text, undo.

Jano-Editor can be used.


Script:
-------
There are very simple script-files to help for the examples
in the /src folder.
The script runs VASM to convert the text to a program, and
After that shows it in the debugger.
Or when an Error was found the text shows where it is.

 attnflag.s has no 080 code and can also be assembled with devpac.
 snippets.s has 080-ammx-code instruction samples.
 float.s    has no 080 code and can also be assembled with devpac.
 afloat.s   has 080-FPU instruction samples.
 anew.s     has 080 integer instructions.
 joy_sep.s  has 080 saga but can also be assembled with devpac.

For the snippets.s just:
CLI
EXECUTE snippets_script



Links:
------
Source examples can be found on:
www.apollo-core.com/downloads/

Forum: Developer Documentation.
apollo-core.com/knowledge.php?b=5&note=38530

archive.org/details/DevPacV3.00.Manual
sun.hasenbraten.de/vasm/release/vasm.pdf

vasm lastest version (daily updated)
sun.hasenbraten.de/vasm/bin/cur/vasmm68k_mot_os3.lha
