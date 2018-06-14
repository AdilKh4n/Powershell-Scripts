# Powershell-Scripts

Write a PowerShell function that will take three inputs (a source path, destination1 path, destination2 path) and do the following:

<li>	take all files starting with any letter from A-L (case insensitive) from one folder (source) and move to one folder (destination1) </li>
<li>	take all files starting with any letter from M-Z (case insensitive) from one container (source) and move them to another folder (destination2) </li>
<li>	If the filename starts with any other character other a-z it should be deleted instead of moved
If the function runs and finds no files to be moved or deleted, it should log a warning in PowerShell that no files were found for processing. </li>

<br> <br>

a.	Using Pester (a PowerShell testing framework) - https://github.com/pester/Pester, write tests for the following 3 scenarios:
<li>	No files exist in the source folder – then run the function – test that a warning was issued </li>
<li>	The following files were in the source folder (apple.txt,pear.txt,1234.txt) – run the function – test the output is correct according to the expected behavior for the function </li>
<li> The following files were in the source folder (apple.txt. bobcat.txt) – run the function – test the output is correct according to the expected behavior– run the function again – test the output is correct according to the expected behavior of the function </li>
