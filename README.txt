Version 2.0.1 of Relpair is a minor bug fix release.  There are two primary improvements
over Version 2.0:

  1) Table 2 in the output now accurately reflects counts of discrepancies based on 
the "critval" parameter (control file, line 12).  Counts reported in version 2.0 assumed 
critval to be 1, but were accurate otherwise.

  2) Version 2.0.1 uses substantially less memory on some Linux configurations.  If 
you had any problems running Version 2.0 under Linux, it is highly recommended that
you try Version 2.0.1.

All file formats (both input and output) are identical to those of Version 2.0.

wld 6/15/04
