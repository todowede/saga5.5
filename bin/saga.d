#!/bin/csh -v 
#
limit stacksize unlimited
limit datasize unlimited

#setenv sagabin $SAGADIR/bin
setenv sagabin $SAGADIR/bin/$HOSTTYPE-$FORTRAN
setenv filename $1
setenv FOR001  $1.dat
setenv FOR002  $1.in
setenv FOR003  $1.wei
setenv FOR007  $1.out
setenv FOR009  $1.eof 
setenv FOR010  $1.mat
setenv FOR011  $1b.mat
setenv FOR013  $1.m
setenv FOR019  $1.plp
setenv FOR020  $1.plt
setenv FOR028  $1.cdr
setenv FOR029  $1.bdr
setenv FOR030  $1.obs
setenv FOR031  $1.pri
#setenv FOR032  slave.obs
setenv FOR042  $1.sou
setenv FOR040  $1_gib.m
setenv FOR060  $1.ext
setenv FOR080  $1.enum
setenv FOR085  $1.gs1
setenv FOR086  $1.gs2
setenv FOR090  $1.env
if ($USER == "gerstoft") then
    setenv DB ''
else
    setenv DB 'nice +19'
endif
if ( $#argv == 3 ) then
  if ($argv[3] == "cov")  then
     setenv FOR002  cov.in
     echo 'cov.in is linked'  
  endif
  if ($argv[3] == "dbx")  then
     setenv DB idb
     echo 'entering debugging mode'  
  endif
endif

if ( $#argv == 1 ) then
  echo ' Only one parameter; Was the forward model specified ?'
endif
  if ($argv[2] == "snap") then        
       $DB $sagabin/sagasnap 
  else if ($argv[2] == "snaprd") then 
       $DB $sagabin/sagasnaprd 
  else if ($argv[2] == "oast") then 
       $DB $sagabin/sagaoast 
  else if ($argv[2] == "oasr") then 
       $DB $sagabin/sagaoasr 
  else if ($argv[2] == "oastg") then 
       $DB $sagabin/sagaoastg 
  else if ($argv[2] == "test") then 
       $DB ~/saga30jul/bin/sagaoastg 
  else if ($argv[2] == "popp") then 
       $DB $sagabin/sagapopp 
  else if ($argv[2] == "tpem") then 
       $DB $sagabin/sagatpem 
  else if ($argv[2] == "slave") then 
       $DB $sagabin/sagaslave 
  else if ($argv[2] == "tabu") then 
       $DB $sagabin/tabu 
  else if ($argv[2] == "prosim") then 
       echo  $DB $sagabin/sagaprosim 
       $DB $sagabin/sagaprosim 
  else if ($argv[2] == "cprosim") then 
       echo  $DB $sagabin/sagacprosim 
       $DB $sagabin/sagacprosim 
  else if ($argv[2] == "gama") then 
       echo  $DB $sagabin/sagagama 
       $DB $sagabin/sagagama 
  else if ($argv[2] == "ramgeo") then 
       echo  $DB $sagabin/sagaramgeo 
       $DB $sagabin/sagaramgeo 
  else if ($argv[2] == "orca") then 
       echo  $DB $sagabin/sagaorca 
       $DB $sagabin/sagaorca 
  else 
       echo " Forward model $argv[2] not valid "
  endif



