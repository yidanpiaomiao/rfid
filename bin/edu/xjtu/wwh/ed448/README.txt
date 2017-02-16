Here is a simple explanation about package <edu.xjtu.wwh.ed448>.

This package is the interface of the ed448 encryption. In Ed448Imp class, we provide
the related encryption method(jni). 

After declaring the native methods, It is important to compile the corresponding C 
header file using command "javah edu.xjtu.wwh.ed448.Ed448Imp" manually in java root 
dictionary. (It is properly to make it in MakeFile in future, but now it just relays
on the command line.)

Then it is the time to rename the generated header file in your will, and locate it
in dictionary "/ed448/include". After done, you should implement those native methods
in CXX file (now the dictionary is "/ed448/test").

Hope this will work!

 Wang Weihua