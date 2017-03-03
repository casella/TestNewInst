# TestNewInst
Test cases for the new front end of OpenModelica

To generate large test cases, edit MakeSystem.mos, then run
  omc MakeSystem.mos
The .mo files containing the test cases are generated in the tmp/ directory

To instantiate the test cases with textual output, run
  omc -d=newInst -i=System_NNN Networks.mo System_NNN.mo

To instantiate the test cases without textual output and time measurement (on Linux), run
  time omc -d=newInst -q -i=System_NNN Networks.mo System_NNN.mo
  