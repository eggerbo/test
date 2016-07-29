// New comment


//Macro for nuclei segmentation Version 070415

open();
//opens directory to choose a stack or image

run("Split Channels");
//split into single the channels

title = "Attention";
  msg = "Select channel for segmentation then click \"OK\".";
  waitForUser(title, msg);

waitForUser
//the macro waits for the user to select the channel that it is going to be used for the segmentation 
//after selecting the stack or image, click "ok" and again "ok"

run("Subtract Background...", "rolling=40 stack"); 
//Background subtraction
run("Smooth", "stack"); 
//Smoothening
run("Auto Threshold", "method=Default stack"); 
//Autothreshold segmentation
run("Make Binary", "stack");  
//Makes a binary stack or image
run("Watershed", "stack");
//Watershed

run("Open", "stack");

open();
//opens directory for the user to select the original stack or image again to perform ratiometric analysis

run("Split Channels");
//split into single the channels

run("Blob Ratiometrics 1");
//runs plugin

//A window opens and the user should choose the GFP channel in the first line, and the RFP channel in the second line. 
//For the mask use the result picture from the macro (it has the same name as the RFP channel stack but it appears always first on the list). 
//We usually don't use background substraction and use a particle minimum size of 3.
