@echo off
%~d0
cd /d %~dp0
::note:
::          1. data type of property table support: int, double, string. 
::          2. default coordinate system: projection coordinate system, in other words,
::             the measuring unit of map is meters but not degree. if a geographic
::             coordinate system is used, do not forget to change some parameters, 
::             e.g. maxSize
::parameters
::    -inputFile         :  input file name(.shp)
::    -outputFile        :  output file name(.shp)
::    -split_flag_field  :  field name of the property sheet. This field values 
::                          must be integers. 0 represents that parcel will never
::                          adapt subdivision, and 1 is the opposite. 
::                          Default 'split'.
::    -maxIteration      :  maximum iteration number, recommendation 3 ~ 5, 
::                          however, it depends. 
::                          Default 3.
::    -maxSize           :  the maximum value of parcel area, which limits the size
::                          of the newly generated parcels. 
::                          recommendation : mean of area. Default 0.
::                          if maxSize <= 0, program will adapt another method to 
::                          restrain the subdivision. Parameter N is needed in another
::                          method, which form a new threshold (area_mean, area_mean +
::                          N * area_std).
::    -N                 :  times of the standard deviation of area. see -maxSize. 
::                          Recommendation 2.0 ~ 5.0. Default 3.0
::    -print             :  0 means printing detailed information,  1 is the opposite
.\RLPS\RLPS.exe -inputFile data/shenzhentaz.shp -outputFile data/shenzhentaz_split0.shp -split_flag_field split_flag -maxIteration 3 -maxSize 0 -N 3.0 -print 0
.\RLPS\RLPS.exe -inputFile data/shenzhentaz.shp -outputFile data/shenzhentaz_split1.shp -split_flag_field split_flag -maxIteration 3 -maxSize 3000000 -print 0
echo exit
pause > nul 