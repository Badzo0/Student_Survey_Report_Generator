# Student_Survey_Report_Generator
&nbsp;

This app is availible here: https://podobnik.shinyapps.io/StudentSurveyReporteR/

# How to run locally:

On this page go to Code -> Download Zip

<img src="/img1.png"
     style="float: left; margin-right: 10;" />
     
     
     
Unzip the downloaded file and open "Student_Survey_Report_Generator.Rproj" (This will open Rstudio)   
    
<img src="/img2.png"
     style="float: left; margin-right: 10;" />
&nbsp;

In RStudio in the Files tab (Located on the bottom right side) open the server.R file (Double click on it)

<img src="/img3.png"
     style="float: left; margin-right: 10;" />
&nbsp;

When opened a notice will show up prompting you to install the required libraries. Click "install" and wait for the process to finish

<img src="/img4.png"
     style="float: left; margin-right: 10;" />
&nbsp;

Click "Run App" in the top right corner of the document to start the application


# Frequently Asked Questions

1. I receive an "UI not found" error when running the app:
 
     This happens when only part of the .zip folder is extracted. In windows machines when you double click on a .zip file the contents of the file are shown but not extracted. You have to click "Extract all" and then navigate to the extracted folder to open the .Rproj file. 
     
<img src="/img6.png"
     style="float: left; margin-right: 10;" />
&nbsp;
<img src="/img5.png"
     style="float: left; margin-right: 10;" />
&nbsp;

2. I see an error about package versions not matching the expected version:     
    
   This happens when the R version is not updated to the latest version. To fix this issue you need to install R again. You can do so on this page:          https://www.r-project.org/
   
  
  3. An error apears that looks like this:  "An error has occurred! package or namespace load failed for ‘likert’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]): there is no package called ‘tmvnsim’"
     
     This means you installed the packages but some dependancies were not installed. You need to run this command: 
     "install.packages("likert", dependencies=TRUE)" - instead of "likert" insert whichever library failed to load based on the error message
     
     R might ask you to install Rtools. do that and re-run the same command. This should install the package with all it's dependancies. 
